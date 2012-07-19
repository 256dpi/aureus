module Aureus

	module Generators

		class CopyDeviseI18nGenerator < Rails::Generators::Base

			desc "copies the improved devise i18n files"
			source_root File.expand_path("../templates", __FILE__)

			def generate
				["devise_base.en.yml","devise_mail.en.yml","devise_ui.en.yml"].each do |f|
					copy_file f, "config/locales/"+f
				end
			end

		end

	end

end