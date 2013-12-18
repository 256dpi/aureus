module Aureus

	module Components

		class Navigation < Renderable

			def initialize
				@title = ''
				@buttons = Array.new
			end

			def title title
				@title = title
			end

			def button content
				@buttons << NavigationButton.new(content)
			end

			def submit_form_button resource, text
				form_class = resource.is_a?(String) ? resource : resource.class.name.underscore
        tag = content_tag 'a', text, onclick: "aureus_trigger_form('form.#{form_class}')", class: 'submit_form_button'
        @buttons << NavigationButton.new(tag)
			end

			def render
				content_tag 'div', class: 'aureus-navigation' do
					compact content_tag('h2', content_tag('span',@title)), content_tag('ul', compact_render(*@buttons), id: 'quicklinks')
				end
			end

		end

		class NavigationButton < Renderable

			def initialize content
				@content = content
			end

			def render
				content_tag 'li', @content
			end

		end

	end

end
