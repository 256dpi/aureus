module Aureus

  module Generators

    class DeviseInvitableI18nGenerator < Rails::Generators::Base

      desc 'generates base i18n files for the devise views'
      source_root File.expand_path('../locales', __FILE__)
      argument :language, type: :string, default: 'en'

      def generate
        file_list = Dir.glob("#{File.dirname(__FILE__)}/locales/*.#{language}.yml")
        puts "Generating invitable locale files for language: '#{language}'..."
        file_list.each do |locale_file|
          basename = File.basename(locale_file)
          destination = "config/locales/#{basename}"
          copy_file locale_file, destination
        end
      end

    end

  end

end
