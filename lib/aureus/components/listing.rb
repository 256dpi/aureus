module Aureus
  module Components
    class Listing < Renderable
      def initialize
        @entries = Array.new
        yield(self)
      end

      def entry(head, body = nil, &block)
        init_haml_helpers
        if block_given?
          @entries << ListingEntry.new(head, capture_haml(&block))
        else
          @entries << ListingEntry.new(head, body)
        end
      end

      def render
        content_tag 'table', compact_render(*@entries), class: 'aureus-simple-table'
      end
    end

    class ListingEntry < Renderable
      def initialize(head, body)
        @head = head
        @body = body
      end

      def render
        content_tag 'tr' do
          compact content_tag('th', @head), content_tag('td', @body)
        end
      end
    end
  end
end
