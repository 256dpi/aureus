module Aureus

	class Table < Renderable

		def initialize resource, toolbar = true
			@resource = resource
			@toolbar = toolbar
			@head = TableHead.new
			@rows = Array.new
		end

		def head
			yield @head
		end

		def row
			@resource.each do |r|
				row = TableRow.new
				yield row, r
				@rows << row
			end
		end

		def render
			content_tag "table", :id => @resource.class.name.downcase, :class => (@toolbar?"datatable":"datatable-no-toolbar") do
				compact @head.render, content_tag("tbody",compact_render(*@rows))
			end
		end

	end

	class TableHead < Renderable

		def initialize
			@columns = Array.new
		end

		def text name
			@columns << TableHeadColumn.new(name,"text-sorting")
		end

		def date name
			@columns << TableHeadColumn.new(name,"date-sorting")
		end

		def raw name
			@columns << TableHeadColumn.new(name,"no-sorting")
		end

		def render
			raw ""
			content_tag "thead" do
				content_tag "tr" do
					out = String.new.html_safe
						@columns.each do |i|
						out += i.render
					end
					out
				end
			end
		end

	end

	class TableHeadColumn < Renderable

		def initialize name, sorting
			@name = name
			@sorting = sorting
		end

		def render
			content_tag "th", @name, :class => @sorting
		end

	end

	class TableRow < Renderable

		def initialize
			@cells = Array.new
			@buttons = Array.new
		end

		def cell data
			@cells << TableRowCell.new(data)
		end

		def button type, content
			@buttons << TableRowButton.new(type,content)
		end

		def render
			content_tag "tr", compact_render(*@cells)+content_tag("td",compact_render(*@buttons),:class => "buttons")
		end

	end

	class TableRowCell < Renderable

		def initialize data
			@data = data
		end

		def render
			content_tag "td", @data
		end

	end

	class TableRowButton < Renderable

		def initialize type, content
			@type = type
			@content = content
		end

		def render
			@content
		end

	end

end