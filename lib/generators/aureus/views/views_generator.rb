module Aureus

	module Generators

		class ViewsGenerator < Rails::Generators::Base
			include ActiveSupport::Inflector

			desc 'generates aures views for a existing model'
			source_root File.expand_path('../templates', __FILE__)
			argument :resource, type: :string, required: true
			argument :controller, type: :string, required: true
      argument :columns, type: :array

			def generate
				model_name = resource.camelize
				folder = controller.gsub(/Controller$/,'').underscore
				target = ['app/views',folder].join '/'
				namespace = folder.split('/').slice(0...-1)
				model_name.constantize
				controller.constantize
				real_name = model_name.demodulize
        name_singular = real_name.underscore.downcase
				route = folder.gsub('/','_').singularize

				if yes? "generate views for '#{model_name}' to: '#{target}'?"
					directory 'views', target
					replacements = {
						model: model_name,
						name_singular: name_singular,
						name_plural: real_name.pluralize.underscore.downcase,
						path_singular: route,
						path_plural: route.pluralize,
						table_heads: columns.collect{ |c| "- h.text t('.column_#{c}')" }.join("\n").indent(8),
						table_cells: columns.collect{ |c| "- r.cell #{name_singular}.#{c}" }.join("\n").indent(8),
						entries: columns.collect{ |c| "- l.entry t('.entry_#{c}'), @#{name_singular}.#{c}" }.join("\n").indent(8),
						inputs: columns.collect{ |c| "= f.input :#{c}, label: t('.field_#{c}')" }.join("\n").indent(8),
						form_path: namespace.collect{ |n| "'#{n}'" }.push("@#{name_singular}").join(',')
					}
					Dir[target+'/*.haml'].each do |file|
						replacements.each do |key,value|
							gsub_file file, "{{{#{key.to_s}}}}", value, verbose: false
						end
					end
				end

				i18n_file = "config/locales/en/#{route.pluralize}.en.yml"
				if yes? 'generate i18n file to: '+i18n_file+'?'
					singular = real_name
					plural = real_name.pluralize
					base_i18n = {
						plural.downcase => {
      				index: { title: plural, button_new: "Add #{singular}" },
      				new: { title: 'New '+singular, button_cancel: 'Cancel', button_save: 'Save' },
      				edit: { title: 'Edit '+singular, button_cancel: 'Cancel', button_save: 'Save' },
      				form: { box_title: 'Details' },
      				list: { box_title: plural+' Listing', destroy_confirm: "Really want to delete the #{singular}?" },
      				show: { title: singular, button_edit: "Edit #{singular}", button_back: 'Back' },
      				item: { box_title: 'Details' }
      			}
					}
      		columns.each do |c|
      			base_i18n[plural.downcase][:item][("entry_#{c}")] = c.titleize
      			base_i18n[plural.downcase][:list][("column_#{c}")] = c.titleize
      			base_i18n[plural.downcase][:form][("field_#{c}")] = c.titleize
      		end
      		namespace.reverse.each do |n|
      			base_i18n = { n => base_i18n }
      		end
      		base_i18n = { en: base_i18n }
					create_file i18n_file, base_i18n.deep_stringify_keys.to_yaml
				end

			end

		end

	end

end