module Aureus
  module Components
    class Row < Renderable
      def initialize &block
        init_haml_helpers
        @columns = Array.new
        @content = capture_haml self, &block
      end

      def column width, &block
        @columns << RowColumn.new(width,capture_haml(&block))
      end

      def space width
        @columns << RowColumn.new(width,'')
      end

      def divider
        tag 'hr'
      end

      def render
        if @columns.empty?
          content_tag 'div', @content, class: 'row'
        elsif @columns.length == 1
          content_tag 'div', @columns.first.content, class: 'row'
        else
          total_width = @columns.inject 0 do |sum, n|
            sum + n.width
          end
          out = String.new.html_safe
          @columns.each_with_index do |c,i|
            left = 0.5
            right = 0.5
            width = (100.0 / total_width * c.width).round
            if i == 0
              left = 0
              width -= 0.5
            elsif i == @columns.length-1
              right = 0
              width -= 0.5
            else
              width -= 1
            end
            out += content_tag 'div', c.render, class: :column, style: "width: #{width}%; margin-left: #{left}%; margin-right: #{right}%"
          end
          content_tag 'div', out, class: 'row'
        end
      end

    end

    class RowColumn < Renderable
      attr_reader :width, :content

      def initialize  width, content
        @width = width
        @content = content
      end
    end
  end
end
