module Aureus

	class Row < Renderable

		def initialize &block
			init_haml_helpers
			@content = capture_haml &block
		end

		def render
			content_tag "div", @content, :class => "row"
		end

	end

end