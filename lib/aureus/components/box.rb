module Aureus

	module Components

		class Box < Renderable

			def initialize title, options, &block
				init options, for: :text, centered: false
				init_haml_helpers
				@title = title
				@buttons = Array.new
				@content = capture_haml self, &block
			end

			def content &block
				@new_content = capture_haml &block
			end

			def foot &block
				@foot = capture_haml &block
			end

			def button content
				@buttons << BoxButton.new(content)
			end

			def render
				title = content_tag('h3',compact(content_tag('span',@title),compact_render(*@buttons)))
				classes = ['box']
				classes << 'centered' if @options[:centered]
				@content = @new_content if not @new_content.nil?
				content_tag 'div', class: classes.join(' ') do
					case @options[:for]
						when :form
							@content = content_tag('ul',@content,class: 'content')
					end
					footer = @foot.nil? ? '' : content_tag('div',@foot,class: 'foot')
					compact title, content_tag('div',@content), footer
				end
			end

		end

		class BoxButton < Renderable

			def initialize content
				@content = content
			end

			def render
				@content
			end

		end

	end

end
