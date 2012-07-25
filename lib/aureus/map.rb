module Aureus

	class Map < Renderable

		def initialize args
			init args, {}
		end

		def render
			if @options[:longitude] and @options[:latitude]
				content_tag("iframe","",:src => "https://maps.google.ch/maps?q="+@options[:latitude].to_s+","+@options[:longitude].to_s+"&ie=UTF8&z=15&output=embed", :width => @options[:width], :height => @options[:height])
			end
		end

	end

end