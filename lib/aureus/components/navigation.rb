module Aureus
  module Components
    class Navigation < Renderable
      def initialize
        @title = ''
        @buttons = Array.new
        yield(self)
      end

      def title(title)
        @title = title
      end

      def button(content)
        @buttons << NavigationButton.new(content)
      end

      def render
        content_tag 'div', class: 'aureus-navigation' do
          compact content_tag('h2', content_tag('span', @title)), content_tag('ul', compact_render(*@buttons), id: 'quicklinks')
        end
      end
    end

    class NavigationButton < Renderable
      def initialize(content)
        @content = content
      end

      def render
        content_tag 'li', @content
      end
    end
  end
end
