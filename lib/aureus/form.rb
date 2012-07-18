module Aureus

	class Form < Renderable

		def initialize args, &block
			init_haml_helpers
			semantic_form_for ["system", @user] do |f|
				@content = capture_haml f, &block
			end
		end

		def render
			@content
		end

	end

end