module Aureus

	module Generators

		class DeviseGenerator < Rails::Generators::Base

			desc 'generates aureus compliant devise haml views with aureus helpers and i18n files'
			source_root File.expand_path('../templates', __FILE__)
			argument :folder, type: :string, default: 'devise'

			def generate
				target = "app/views/#{folder}"
				directory 'devise', target
				Dir[target+'/**/*.haml'].each do |file|
					gsub_file file, '{{{folder}}}', folder, verbose: false
        end

        ['devise_base.en.yml','devise_mail.en.yml','devise_ui.en.yml'].each do |f|
          copy_file f, "config/locales/#{f}"
        end
			end

		end

	end

end
