module Aureus
  module Helper
    include Formtastic::Helpers::FormHelper

    def aureus_toolbar(title, &block)
      Components::Toolbar.new(title, &block).render
    end

    def aureus_navigation(&block)
      Components::Navigation.new(&block).render
    end

    def aureus_messages(flash)
      Components::Messages.new(flash).render
    end

    def aureus_row(&block)
      Components::Row.new(&block).render
    end

    def aureus_box(title, *args, &block)
      Components::Box.new(title, args, &block).render
    end

    def aureus_datatable(resource, &block)
      Components::DataTable.new(resource, &block).render
    end

    alias_method :aureus_form, :semantic_form_for

    def aureus_listing(&block)
      Components::Listing.new(&block).render
    end

    def aureus_simple_map(*args)
      Components::SimpleMap.new(args).render
    end
  end
end
