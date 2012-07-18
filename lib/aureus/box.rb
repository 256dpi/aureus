module Aureus

	class Box < Renderable

		def initialize title, options, &block
			init_haml_helpers
			@title = title
			@options = options
			@content = capture_haml &block
		end

		def render
			title = content_tag("h3",@title)
			content_tag "div", :class => "box" do
				case @options[:for]
				when :form
					compact title, content_tag("div",content_tag("ul",@content,:class => "content"))
				when :text, :table
					compact title, content_tag("div",@content)
				end
			end
		end

	end

end