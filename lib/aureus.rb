require "aureus/version"
require "aureus/engine"

module Aureus
	
	extend ActiveSupport::Autoload
	autoload :Helper
	autoload :Toolbar
	autoload :Navigation
	autoload :Messages
	autoload :Content

	class Renderable
		include ActionView::Context
		include ActionView::Helpers::TagHelper

		def content_tag(name, content_or_options_with_block = nil, options = nil, escape = false, &block)
			super name, content_or_options_with_block, options, escape, &block
		end

		def compact *args
			out = String.new.html_safe
			args.each do |i|
				out += i
			end
			out
		end
	end

end