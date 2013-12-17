module Aureus

  class Engine < Rails::Engine

    config.autoload_paths += Dir['#{config.root}/lib/**/']

    initializer 'aureus.configure_rails_initialization' do |app|
      app.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
      app.config.assets.precompile += %w( .otf )
      ActiveSupport.on_load :action_view do
        include Aureus::Helper
      end
    end
    
  end

end