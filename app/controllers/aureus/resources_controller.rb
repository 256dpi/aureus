module Aureus
  class ResourcesController < AureusController
    before_filter :aureus_generate

    OPTIONS = [:title, :box_title, :buttons, :form_inputs, :item_entries, :table_cells, :row_actions]

    protected

    def aureus_generate
      ensure_dictionary

      @aureus_defaults[:box_title] = 'Attributes'

      case params[:action]
        when 'index'
          @aureus_defaults[:title] = "All #{params[:controller].capitalize}"
          @aureus_defaults[:box_title] = 'List'
        when 'new'
          @aureus_defaults[:title] = "New #{params[:controller].singularize.capitalize}"
        when 'show'
          @aureus_defaults[:title] = "View #{params[:controller].singularize.capitalize}"
        when 'edit'
          @aureus_defaults[:title] = "Edit #{params[:controller].singularize.capitalize}"
      end
    end

    def aureus_defaults (*options)
      ensure_dictionary
      options = options.extract_options!

      OPTIONS.each do |option|
        @aureus_defaults[option] = options[option] || @aureus_defaults[option] || nil
      end
    end

    def aureus(resource_or_collection, *options)
      ensure_dictionary
      options = options.extract_options!

      OPTIONS.each do |option|
        instance_variable_set(:"@aureus_#{option}", options[option] || @aureus_defaults[option]) || nil
      end

      if params[:action] == 'index'
        @aureus_resources = resource_or_collection
      else
        @aureus_resource = resource_or_collection
      end
    end

    def ensure_dictionary
      @aureus_defaults = {} unless @aureus_defaults
    end
  end
end
