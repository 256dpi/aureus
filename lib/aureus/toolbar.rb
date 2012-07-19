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
			content_tag "div", { :id => "aureus-toolbar" } do
				compact content_tag("h1",@title), @left.render, @right.render
			end
		end

	end

	class ToolbarSection < Renderable

		def initialize position
			@items = Array.new
			@position = position
		end

		def link_to text, url, *args
			@items << ToolbarButton.new(text,url,args)
		end

		def info text
			@items << ToolbarInfo.new(text)
		end

		def render
			content_tag "ul", compact_render(*@items), :class => @position
		end

	end

	class ToolbarButton < Renderable

		def initialize text, url, args
			@text = text
			@url = url
			@args = args
		end

		def render
			content_tag "li", link_to(@text,@url,*@args)
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