module Aureus
  class ResourcesController < AureusController
    protected

    def aureus_defaults(hash)
      @_aureus = (@_aureus || {}).merge(hash)
    end

    def aureus_initialize(options)
      @_aureus ||= {}
      @_aureus[:box_title] = 'Attributes'
      @_aureus[:form_inputs] = options[:form_fields].map{|f| [f] }

      case params[:action]
        when 'index'
          @_aureus[:title] = "All #{resource_name.pluralize}"
          @_aureus[:box_title] = 'List'
          if options[:actions].include?(:new)
            @_aureus[:navigation_buttons] = [["New #{resource_name}", path_for(:new)]]
          end
          @_aureus[:table_cells] = options[:table_fields].map{|f| [f.to_s.capitalize, lambda{|r| r.send(f) }] }
          @_aureus[:row_actions] = []
          if options[:actions].include?(:show)
            @_aureus[:row_actions] << lambda{|r| [:show, path_for(:show, r.id)] }
          end
          if options[:actions].include?(:edit)
            @_aureus[:row_actions] << lambda{|r| [:edit, path_for(:edit, r.id)] }
          end
          if options[:actions].include?(:destroy)
            @_aureus[:row_actions] << lambda{|r| [:destroy, path_for(:destroy, r.id), confirm: 'Really?'] }
          end
        when 'new'
          @_aureus[:title] = "New #{resource_name}"
            @_aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
        when 'show'
          @_aureus[:title] = "View #{resource_name}"
          @_aureus[:navigation_buttons] = [['Back', path_for(:index)]]
          @_aureus[:item_entries] = options[:item_fields].map{|f| [f.to_s.capitalize, lambda{|r| r.send(f) }] }
        when 'edit'
          @_aureus[:title] = "Edit #{resource_name}"
          @_aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
      end
    end

    def aureus(resource_or_collection, hash={})
      @_aureus = (@_aureus || {}).merge(hash)

      if params[:action] == 'index'
        @_aureus[:resources] = resource_or_collection
      else
        @_aureus[:resource] = resource_or_collection
      end
    end

    private

    def resource_name
      params[:controller].split('/').last.singularize.capitalize
    end

    def path_for(action, id=nil)
      url_for(action: action, id: id, only_path: true)
    end
  end
end
