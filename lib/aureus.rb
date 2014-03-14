require 'aureus/version'

require 'formtastic'
require 'haml'
require 'jquery-rails'
require 'leaflet-rails'
require 'normalize-rails'
require 'mapbox-rails'

module Aureus
  module Components
    autoload :Box, 'aureus/components/box'
    autoload :Content, 'aureus/components/content'
    autoload :DataTable, 'aureus/components/data_table'
    autoload :Listing, 'aureus/components/listing'
    autoload :Messages, 'aureus/components/messages'
    autoload :Navigation, 'aureus/components/navigation'
    autoload :Row, 'aureus/components/row'
    autoload :SimpleMap, 'aureus/components/simple_map'
    autoload :Toolbar, 'aureus/components/toolbar'
  end
end

require 'aureus/renderable'
require 'aureus/helper'
require 'aureus/engine'
