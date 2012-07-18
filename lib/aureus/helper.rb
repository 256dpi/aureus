module Aureus
	module Helper

		def aureus_toolbar title
      toolbar = Toolbar.new title
      yield toolbar
      toolbar.render
		end

		def aureus_navigation
			navigation = Navigation.new
			yield navigation
			navigation.render
		end

		def aureus_messages flash
			messages = Messages.new flash
			messages.render
		end

		def aureus_content html
			content = Content.new html
			content.render
		end

		def aureus_row &block
			row = Row.new &block
			row.render
		end

		def aureus_box title, *args, &block
			options = args.extract_options!
      options[:for] ||= :text
			box = Box.new title, options, &block
			box.render
		end

		def aureus_datatable resource
			table = DataTable.new resource
			yield table
			table.render
		end

		def aureus_form *args, &block
			semantic_form_for *args do |f|
				capture_haml f, &block
			end
			#form = Form.new args, &block
			#form.render
		end

	end

end
