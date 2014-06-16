module Aureus
  class ResourcesController < AureusController
    protected

    def aureus_override(hash)
      @_aureus = (@_aureus || {}).merge(hash)
    end

    def aureus(options)
      @_aureus ||= {}
      @_aureus[:box_title] = 'Attributes'
      @_aureus[:form_inputs] = (options[:form_fields] || []).map{|f| [f] }

      @_aureus[:resource] = lambda{ instance_variable_get(:"@#{model_name}") }
      @_aureus[:resources] = lambda{ instance_variable_get(:"@#{model_name.pluralize}") }

      case params[:action]
        when 'index'
          @_aureus[:title] = "All #{model_name.pluralize.titleize}"
          @_aureus[:box_title] = 'List'
          if options[:actions].include?(:new)
            @_aureus[:navigation_buttons] = [["New #{model_name.titleize}", path_for(:new)]]
          end
          @_aureus[:table_cells] = (options[:table_fields] || []).map{|f| [f.to_s.titleize, lambda{|r| r.send(f) }] }
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
          @_aureus[:title] = "New #{model_name.titleize}"
            @_aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
        when 'show'
          @_aureus[:title] = "View #{model_name.titleize}"
          @_aureus[:navigation_buttons] = [['Back', path_for(:index)]]
          @_aureus[:item_entries] = (options[:item_fields] || []).map{|f| [f.to_s.titleize, lambda{|r| r.send(f) }] }
        when 'edit'
          @_aureus[:title] = "Edit #{model_name.titleize}"
          @_aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
      end
    end

    private

    def model_name
      params[:controller].split('/').last.singularize
    end

    def path_for(action, id=nil)
      url_for(action: action, id: id, only_path: true)
    end
  end
end
