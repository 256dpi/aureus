require "aureus/version"
require "aureus/engine"

require "formtastic"
require "haml"

module Aureus
	extend ActiveSupport::Autoload

	autoload :Helper
	autoload :Toolbar
	autoload :Navigation
	autoload :Messages
	autoload :Content
	autoload :Row
	autoload :Box
	autoload :DataTable
	autoload :Form

	class Renderable
		include ActionView::Context
		include ActionView::Helpers::TagHelper
		include ActionView::Helpers::CaptureHelper
		include ActionView::Helpers::UrlHelper
		include Haml::Helpers

		def init args, *defaults
			@options = defaults.extract_options!.merge args.extract_options!
		end

		def content_tag name, content_or_options_with_block = nil, options = nil, escape = false, &block
			super name, content_or_options_with_block, options, escape, &block
		end

		def compact *args
			out = String.new.html_safe
			args.each do |i|
				out += i
			end
			out
		end

		def compact_render *args
			out = String.new.html_safe
			args.each do |i|
				out += i.render
			end
			out
		end

	end

end