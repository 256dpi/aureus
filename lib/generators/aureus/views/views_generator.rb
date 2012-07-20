module Aureus

	module Generators

		class ViewsGenerator < Rails::Generators::Base

			include ActiveSupport::Inflector

			desc "generates aures views for a existing model"
			source_root File.expand_path("../templates", __FILE__)
			argument :resource, :type => :string, :required => true
			argument :controller, :type => :string, :required => true
			def generate
				model_name = resource.camelize
				folder = controller.gsub(/Controller$/,"").underscore
				target = ["app/views",folder].join "/"
				namespace = folder.split("/").slice(0...-1)
				if yes? "generate views for '"+model_name+"' to: "+target+"?"
					model = model_name.constantize
					columns = model.column_names
					columns2 = columns - ["id","created_at","updated_at"]
					directory "views", target
					real_name = model_name.demodulize
					route = folder.gsub("/","_").singularize
					replacements = {
						"MODEL" => model_name,
						"TITLE_SINGULAR" => real_name,
						"TITLE_PLURAL" => real_name.pluralize,
						"NAME_SINGULAR" => real_name.downcase,
						"NAME_PLURAL" => real_name.pluralize.downcase,
						"PATH_SINGULAR" => route,
						"PATH_PLURAL" => route.pluralize,
						"TABLE_HEADS" => columns.collect{ |c| '        - h.text "'+c.titleize+'"' }.join("\n"),
						"TABLE_CELLS" => columns.collect{ |c| '        - r.cell '+real_name.downcase+'.'+c }.join("\n"),
						"ENTRIES" => columns.collect{ |c| '        - l.entry "'+c.titleize+'", @'+real_name.downcase+'.'+c }.join("\n"),
						"INPUTS" => columns2.collect{ |c| '        = f.input :'+c }.join("\n"),
						"FORM_PATH" => namespace.collect{ |n| '"'+n+'"' }.join(",")
					}
					Dir[target+"/*.haml"].each do |file|
						replacements.each do |key,value|
							gsub_file file, "{{{#{key}}}}", value, :verbose => false
						end
					end
				end

			end

		end

	end

end