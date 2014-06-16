module Aureus
  module Components
    class Toolbar < Renderable
      def initialize(title)
        @title = title
        @left = ToolbarSection.new 'left'
        @right = ToolbarSection.new 'right'
        yield(self)
      end

      def left
        yield @left
      end

      def right
        yield @right
      end

      def render
        content_tag 'div', { class: 'aureus-toolbar' } do
          compact content_tag('h1', @title), @left.render, @right.render
        end
      end
    end

    class ToolbarSection < Renderable
      def initialize(position)
        @items = Array.new
        @position = position
      end

      def link_to(text, url, *args)
        @items << ToolbarButton.new(text, 0, url, args)
      end

      def dropdown(title)
        toolbar = ToolbarDropdown.new(title)
        yield toolbar
        @items << toolbar
      end

      def info(text)
        @items << ToolbarInfo.new(text,0)
      end

      def render
        content_tag 'ul', compact_render(*@items), class: @position
      end
    end

    class ToolbarButton < Renderable
      def initialize(text, level, url, args)
        @text = text
        @level = level
        @url = url
        @args = args
      end

      def render
        content_tag 'li', link_to(@text, @url, *@args), class: "level-#{@level}"
      end
    end

    class ToolbarInfo < Renderable
      def initialize(text, level)
        @text = text
        @level = level
      end

      def render
        content_tag 'li', content_tag('span', @text, class: :info), class: "level-#{@level}"
      end
    end

    class ToolbarDivider < Renderable
      def initialize
      end

      def render
        content_tag 'div', '', class: :line
      end
    end

    class ToolbarDropdown < Renderable
      def initialize(title)
        @title = title
        @items = Array.new
      end

      def link_to(text, url, *args)
        @items << ToolbarButton.new(text,1,url,args)
      end

      def info(text)
        @items << ToolbarInfo.new(text,1)
      end

      def divider
        @items << ToolbarDivider.new
      end

      def render
        title = content_tag 'span', @title, class: 'dropdown-accessor'
        list = content_tag 'ul', compact_render(*@items), class: 'dropdown-inner'
        content_tag 'li', title+list, class: 'dropdown-outer'
      end
    end
  end
end
