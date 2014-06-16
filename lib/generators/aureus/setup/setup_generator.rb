module Aureus
  module Generators
    class SetupGenerator < Rails::Generators::Base
      desc 'generate an aureus initializer file'
      def generate
        initializer 'aureus.rb' do
          "Aureus.parent_controller = 'ApplicationController'"
        end
      end
    end
  end
end
