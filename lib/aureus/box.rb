module Aureus

	class Box < Renderable

		def initialize title, &block
			init_haml_helpers
			@title = title
			@content = capture_haml &block
		end

		def render
			content_tag "div", :class => "box" do
				compact content_tag("h3",@title), content_tag("div",@content)
			end
		end

	end

end