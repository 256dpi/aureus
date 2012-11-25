module Aureus

	class Navigation < Renderable

		def initialize
			@title = ""
			@buttons = Array.new
		end

		def title title
			@title = title
		end

		def button content
			@buttons << NavigationButton.new(content)
		end

		def submit_form_button resource, text
			@buttons << NavigationButton.new(content_tag("a",text,:onclick=>"triggerForm('form.#{resource.class.name.underscore}')"))
		end

		def render
			content_tag "div", :id => "navigation" do
				compact content_tag("h2", content_tag("span",@title)), content_tag("ul", compact_render(*@buttons), :id => "quicklinks")
			end
		end

	end

	class NavigationButton < Renderable

		def initialize content
			@content = content
		end

		def render
			content_tag "li", @content
		end

	end

end