module Aureus

	class Navigation < Renderable

		def initialize
			@title = ""
			@quicklinks = ""
		end

		def title title
			@title = title
		end

		def quicklinks quicklinks
			@quicklinks = quicklinks
		end

		def render
			content_tag "div", :id => "navigation" do
				content_tag "h2" do
					compact content_tag("ul", @quicklinks, :id => "quicklinks"), content_tag("span",@title)
				end
			end
		end

	end

end