module Aureus

	class Content < Renderable

		def initialize content
			@content = content
		end

		def render
			content_tag "div", @content, :id => "content"
		end

	end

end