module Aureus

	module Generators

		class DeviseI18nGenerator < Rails::Generators::Base

			desc 'generates base i18n files for the devise views'
			source_root File.expand_path('../locales', __FILE__)
			argument :language, type: :string, default: 'en'

			def generate
				Dir["*.#{language}.yml"].each do |locale_file|
					copy_file locale_file, "config/locales/#{f}"
				end
			end

		end

	end

end