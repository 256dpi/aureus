module Aureus
  module Generators
    class DeviseViewsGenerator < Rails::Generators::Base
      desc 'generates aureus compliant devise haml views with aureus helpers and i18n files'
      source_root File.expand_path('../templates', __FILE__)
      argument :folder, type: :string, default: 'devise'

      def generate
        target = "app/views/#{folder}"
        directory 'devise', target do |content|
          content.gsub '{{{folder}}}', folder
        end
        #Dir[target + '/**/*.haml'].each do |file|
          #gsub_file file, '{{{folder}}}', folder, verbose: false
        #end
      end
    end
  end
end
