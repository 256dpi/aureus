module Aureus

  module Generators

    class LayoutGenerator < Rails::Generators::Base

      desc 'generate an aureus layout file'
      source_root File.expand_path('../templates', __FILE__)
      argument :name, required: true

      def generate
        copy_file 'layout.html.haml', "app/views/layouts/#{name}.html.haml"
      end

    end

  end

end