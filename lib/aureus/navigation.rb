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

		def submit_form resource, text
			@buttons << NavigationButton.new(content_tag("a",text,:onclick=>"triggerForm('form.#{resource.class.name.downcase}')"))
		end

		def render
			content_tag "div", :id => "navigation" do
				content_tag "h2" do
					compact content_tag("ul", compact_render(*@buttons), :id => "quicklinks"), content_tag("span",@title)
				end
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