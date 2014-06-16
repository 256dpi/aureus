module Aureus
  module Components
    class Messages < Renderable
      def initialize(flash)
        @flash = flash
      end

      def render
        content_tag 'div', class: 'aureus-messages' do
          out = Array.new
          [:notice, :error, :alert].each do |i|
            if @flash[i]
              out << content_tag('p', @flash[i], class: i.to_s)
            end
          end
          compact *out
        end
      end
    end
  end
end
