module Aureus
  module Components
    class Content < Renderable
      def initialize(content, &block)
        @content = content if content
        @content = yield if block
      end

      def render
        content_tag 'div', @content, class: 'aureus-content'
      end
    end
  end
end
