module Aureus

	module Generators

		class CreateDeviseViewsGenerator < Rails::Generators::Base

			desc "create aureus compliant haml views with aureus helpers"
			source_root File.expand_path("../templates", __FILE__)
			argument :folder, :type => :string, :default => "devise"

			def generate
				target = "app/views/"+folder
				directory "devise", target
				Dir[target+"/**/*.haml"].each do |file|
					gsub_file file, "{{{folder}}}", target
				end
			end

		end

	end

end