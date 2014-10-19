require 'aureus/version'

require 'formtastic'
require 'haml'
require 'jquery-rails'
require 'normalize-rails'

module Aureus
  mattr_accessor :site_title
  mattr_accessor :parent_controller
  mattr_accessor :skin
  mattr_accessor :messages_timeout
  mattr_accessor :toolbar_title
  mattr_accessor :toolbar_builder

  self.toolbar_builder = lambda{ |t| }

  module Components
    autoload :Box, 'aureus/components/box'
    autoload :DataTable, 'aureus/components/data_table'
    autoload :Listing, 'aureus/components/listing'
    autoload :Messages, 'aureus/components/messages'
    autoload :Navigation, 'aureus/components/navigation'
    autoload :Row, 'aureus/components/row'
    autoload :Toolbar, 'aureus/components/toolbar'
  end
end

require 'aureus/renderable'
require 'aureus/helper'
require 'aureus/engine'
