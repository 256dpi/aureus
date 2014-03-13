module Aureus

  module Generators

    class DeviseInvitableViewsGenerator < Rails::Generators::Base

      desc 'generates aureus compliant devise invitable haml views with aureus helpers'
      source_root File.expand_path('../templates', __FILE__)
      argument :folder, type: :string, default: 'devise'

      def generate
        target = "app/views/#{folder}"
        directory 'devise_invitable', target
        Dir[target + '/**/*.haml'].each do |file|
          gsub_file file, '{{{folder}}}', folder, verbose: false
        end
      end

    end

  end

end
