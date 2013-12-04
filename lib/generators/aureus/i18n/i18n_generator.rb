module Aureus

  module Generators

    class I18nGenerator < Rails::Generators::Base

      desc 'download i18n files from rails-i18n repository'
      source_root File.expand_path('../templates', __FILE__)
      argument :locale, :type => :string, :required => true

      def generate
        begin
          get "https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/#{locale}.yml", 'config/locales/#{locale}.yml'
        rescue OpenURI::HTTPError
          puts "locale '#{locale}' not found in repository!"
        end
      end

    end

  end

end