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

		def aureus_column width

		end

		def aureus_box title, &block
			box = Box.new title, &block
			box.render
		end

		def aureus_table resource
			table = Table.new resource
			yield table
			table.render
		end

	end

end
