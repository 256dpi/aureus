module Aureus

  module Components

  	class Content < Renderable

  		def initialize content
  			@content = content
  		end

  		def render
  			content_tag "div", @content, :class => "aureus-content"
  		end

  	end

  end

end