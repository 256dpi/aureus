module Aureus

  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path('../../', __FILE__)
    initializer 'aureus.configure_rails_initialization' do |app|
      ActiveSupport.on_load :action_view do
        include Aureus::Helper
      end
    end
    
  end

end
