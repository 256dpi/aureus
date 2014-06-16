require 'aureus/version'

require 'formtastic'
require 'haml'
require 'jquery-rails'
require 'leaflet-rails'
require 'normalize-rails'
require 'mapbox-rails'

module Aureus
  mattr_accessor :site_title
  mattr_accessor :parent_controller
  mattr_accessor :skin
  mattr_accessor :mapbox_id
  mattr_accessor :messages_timeout
  mattr_accessor :toolbar_title
  mattr_accessor :toolbar_builder

  self.toolbar_builder = lambda{|_|}
end

require 'aureus/draft'
require 'aureus/renderable'
require 'aureus/helper'
require 'aureus/engine'

require 'aureus/components/box'
require 'aureus/components/data_table'
require 'aureus/components/listing'
require 'aureus/components/messages'
require 'aureus/components/navigation'
require 'aureus/components/row'
require 'aureus/components/simple_map'
require 'aureus/components/toolbar'
