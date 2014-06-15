module Aureus
  class ResourcesController < AureusController
    OPTIONS = [:title, :box_title, :navigation_buttons, :form_inputs, :item_entries, :table_cells, :row_actions]

    protected

    def aureus_defaults(options)
      apply_options(options)
    end

    def aureus_initialize(options)
      apply_options box_title: 'Attributes',
        form_inputs: options[:form_fields].map{|f| [f] },
        table_cells: options[:table_fields].map{|f| [f.to_s.capitalize, lambda{|r| r.send(f) }] },
        row_actions: [
          lambda{|r| [:show, path_for(:show, r.id)] },
          lambda{|r| [:edit, path_for(:edit, r.id)] },
          lambda{|r| [:destroy, path_for(:destroy, r.id), confirm: 'Really?'] },
        ],
        item_entries: options[:item_fields].map{|f| [f.to_s.capitalize, lambda{|r| r.send(f) }] }

      case params[:action]
        when 'index'
          apply_options title: "All #{params[:controller].capitalize}",
            box_title: 'List',
            navigation_buttons: [["New #{params[:controller].singularize.capitalize}", path_for(:new)]]
        when 'new'
          apply_options title: "New #{params[:controller].singularize.capitalize}",
          navigation_buttons: [['Cancel', path_for(:index)]]
        when 'show'
          apply_options title: "View #{params[:controller].singularize.capitalize}",
          navigation_buttons: [['Back', path_for(:index)]]
        when 'edit'
          apply_options title: "Edit #{params[:controller].singularize.capitalize}",
          navigation_buttons: [['Cancel', path_for(:index)]]
      end
    end

    def aureus(resource_or_collection, options={})
      apply_options(options)

      if params[:action] == 'index'
        apply_options resources: resource_or_collection
      else
        apply_options resource: resource_or_collection
      end
    end

    private

    def path_for(action, id=nil)
      url_for(action: action, id: id, only_path: true)
    end

    def apply_options(hash)
      @_aureus ||= {}
      @_aureus.merge!(hash)
    end
  end
end
