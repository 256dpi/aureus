module Aureus

	module Components

		class SimpleMap < Renderable

			def initialize args
				init args, { height: 300, zoom: 13 }
			end

			def render
				if @options[:longitude] and @options[:latitude]
					content_tag("div",nil, class: "aureus-simple-map", data: @options )
				end
			end

		end

	end

end