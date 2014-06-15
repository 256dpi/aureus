module Aureus
  class Renderable
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::UrlHelper
    include Haml::Helpers

    def initialize content
      @content = content
    end

    def init args, *defaults
      @options = defaults.extract_options!.merge(args.extract_options!)
    end

    def content_tag name, content_or_options_with_block = nil, options = nil, escape = false, &block
      super name, content_or_options_with_block, options, escape, &block
    end

    def compact *args
      args.join.html_safe
    end

    def compact_render *args
      args.map{ |e| e.render }.join.html_safe
    end

    def render
      @content
    end
  end
end
