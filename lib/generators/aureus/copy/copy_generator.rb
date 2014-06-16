module Aureus
  module Generators
    class CopyGenerator < Rails::Generators::Base
      desc 'copy aureus views and layout'
      source_root File.expand_path('../../../../../app/views', __FILE__)

      def generate
        directory 'aureus', 'app/views/aureus'
        copy_file 'layouts/aureus.html.haml', 'app/layouts/aureus.html.haml'
      end
    end
  end
end
