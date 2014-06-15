module Aureus
  class ResourcesController < AureusController
    before_filter :aureus_generate

    OPTIONS = [:title, :box_title, :buttons, :form_inputs, :item_entries, :table_cells, :row_actions]

    protected

    def aureus_generate
      ensure_dictionary

      @_aureus[:box_title] = 'Attributes'

      case params[:action]
        when 'index'
          @_aureus[:title] = "All #{params[:controller].capitalize}"
          @_aureus[:box_title] = 'List'
        when 'new'
          @_aureus[:title] = "New #{params[:controller].singularize.capitalize}"
        when 'show'
          @_aureus[:title] = "View #{params[:controller].singularize.capitalize}"
        when 'edit'
          @_aureus[:title] = "Edit #{params[:controller].singularize.capitalize}"
      end
    end

    def aureus_defaults(*options)
      ensure_dictionary
      apply_options(options.extract_options!)
    end

    def aureus(resource_or_collection, *options)
      ensure_dictionary
      apply_options(options.extract_options!)

      if params[:action] == 'index'
        @_aureus[:resources] = resource_or_collection
      else
        @_aureus[:resource] = resource_or_collection
      end
    end

    private

    def ensure_dictionary
      @_aureus = {} unless @_aureus
    end

    def apply_options(options)
      OPTIONS.each do |option|
        @_aureus[option] = options[option] || @_aureus[option] || nil
      end
    end
  end
end
