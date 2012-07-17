module Aureus

	class Toolbar < Renderable

		def initialize title
			@title = title
			@left = ToolbarSection.new "left"
			@right = ToolbarSection.new "right"
		end

		def left
			yield @left
		end

		def right
			yield @right
		end

		def render
			content_tag "div", { :id => "topbar" } do
				compact content_tag("h1",@title), @left.render, @right.render
			end
		end

	end

	class ToolbarSection < Renderable

		def initialize position
			@items = Array.new
			@position = position
		end

		def button content
			@items << ToolbarButton.new(content)
		end

		def info text
			@items << ToolbarInfo.new(text)
		end

		def render
			content_tag "ul", { :class => @position } do
				out = String.new.html_safe
				@items.each do |i|
					out += i.render
				end
				out
			end
		end

	end

	class ToolbarButton < Renderable

		def initialize content
			@content = content
		end

		def render
			content_tag "li", @content
		end

	end

	class ToolbarInfo < Renderable

		def initialize text
			@text = text
		end

		def render
			content_tag "li", content_tag("span",@text)
		end

	end

end