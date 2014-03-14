module Aureus

	module Helper

		def aureus_toolbar title
      toolbar = Components::Toolbar.new title
      yield toolbar
      toolbar.render
		end

		def aureus_navigation
			navigation = Components::Navigation.new
			yield navigation
			navigation.render
		end

		def aureus_messages flash
			messages = Components::Messages.new flash
			messages.render
		end

		def aureus_content html
			content = Components::Content.new html
			content.render
		end

		def aureus_row &block
			row = Components::Row.new &block
			row.render
		end

		def aureus_box title, *args, &block
			box = Components::Box.new title, args, &block
			box.render
		end

		def aureus_datatable resource
			table = Components::DataTable.new resource
			yield table
			table.render
		end

		def aureus_form args, &block
			semantic_form_for args do |f|
				capture_haml f, &block
			end
		end

		def aureus_listing
			listing = Components::Listing.new
			yield listing
			listing.render
		end

		def aureus_simple_map *args
			map = Components::SimpleMap.new args
			map.render
		end

	end

end
