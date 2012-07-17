module Aureus
  class Engine < Rails::Engine
    ActiveSupport.on_load :action_view do
        include Aureus::Helper
      end
  end
end