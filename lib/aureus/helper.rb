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

		def aureus_content content
			content = Content.new content
			content.render
		end

	end

end
