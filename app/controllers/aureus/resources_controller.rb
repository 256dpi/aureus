module Aureus
  class ResourcesController < AureusController
    protected

    def aureus(options)
      @aureus ||= {}
      @aureus[:box_title] = 'Attributes'
      @aureus[:form_inputs] = (options[:form_fields] || []).map{|f| [f] }

      model_name = params[:controller].split('/').last.singularize

      @aureus[:resource] = lambda{ instance_variable_get(:"@#{model_name}") }
      @aureus[:resources] = lambda{ instance_variable_get(:"@#{model_name.pluralize}") }

      case params[:action]
        when 'index'
          @aureus[:title] = "All #{model_name.pluralize.titleize}"
          @aureus[:box_title] = 'List'
          if options[:actions].include?(:new)
            @aureus[:navigation_buttons] = [["New #{model_name.titleize}", path_for(:new)]]
          end
          @aureus[:table_cells] = (options[:table_fields] || []).map{|f| [f.to_s.titleize, lambda{|r| r.send(f) }] }
          @aureus[:row_actions] = []
          if options[:actions].include?(:show)
            @aureus[:row_actions] << lambda{|r| [:show, path_for(:show, r.id)] }
          end
          if options[:actions].include?(:edit)
            @aureus[:row_actions] << lambda{|r| [:edit, path_for(:edit, r.id)] }
          end
          if options[:actions].include?(:destroy)
            @aureus[:row_actions] << lambda{|r| [:destroy, path_for(:destroy, r.id), confirm: 'Really?'] }
          end
        when 'new'
          @aureus[:title] = "New #{model_name.titleize}"
            @aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
        when 'show'
          @aureus[:title] = "View #{model_name.titleize}"
          @aureus[:navigation_buttons] = [['Back', path_for(:index)]]
          @aureus[:item_entries] = (options[:item_fields] || []).map{|f| [f.to_s.titleize, lambda{|r| r.send(f) }] }
        when 'edit'
          @aureus[:title] = "Edit #{model_name.titleize}"
          @aureus[:navigation_buttons] = [['Cancel', path_for(:index)]]
      end
    end

    private

    def path_for(action, id=nil)
      url_for(action: action, id: id, only_path: true)
    end
  end
end
