require "aureus/version"

require "haml"

module Aureus
  extend ActiveSupport::Autoload

  autoload :Renderable
  autoload :Helper
  autoload :Toolbar
  autoload :Navigation
  autoload :Messages
  autoload :Content
  autoload :Row
  autoload :Box
  autoload :DataTable
  autoload :Form
  autoload :Listing
  autoload :Map

end

require "aureus/engine"