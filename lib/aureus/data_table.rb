module Aureus

	class DataTable < Renderable

		def initialize resource, toolbar = true
			@resource = resource
			@toolbar = toolbar
			@head = DataTableHead.new
			@rows = Array.new
		end

		def head
			yield @head
		end

		def row
			@resource.each do |r|
				row = DataTableRow.new
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

	class DataTableHead < Renderable

		def initialize
			@columns = Array.new
		end

		def text name
			@columns << DataTableHeadColumn.new(name,"text-sorting")
		end

		def date name
			@columns << DataTableHeadColumn.new(name,"date-sorting")
		end

		def raw name
			@columns << DataTableHeadColumn.new(name,"no-sorting")
		end

		def render
			raw ""
			content_tag "thead" do
				content_tag "tr", compact_render(*@columns)
			end
		end

	end

	class DataTableHeadColumn < Renderable

		def initialize name, sorting
			@name = name
			@sorting = sorting
		end

		def render
			content_tag "th", @name, :class => @sorting
		end

	end

	class DataTableRow < Renderable

		def initialize
			@cells = Array.new
			@buttons = Array.new
		end

		def cell data
			@cells << DataTableRowCell.new(data)
		end

		def button type_or_title, url, *args
			if type_or_title.is_a? Symbol
				@buttons << DataTableRowButton.new(type_or_title,type_or_title.to_s,url,args)
			else
				@buttons << DataTableRowButton.new(:text,type_or_title.to_s,url,args)
			end
		end

		def render
			content_tag "tr", compact_render(*@cells)+content_tag("td",compact_render(*@buttons),:class => "buttons")
		end

	end

	class DataTableRowCell < Renderable

		def initialize data
			@data = data
		end

		def render
			content_tag "td", @data
		end

	end

	class DataTableRowButton < Renderable

		def initialize type, text, url, options
			init options, :remote => true, :confirm => "Delete resource?"
			@type = type
			@text = text
			@url = url
		end

		def render
			case @type
			when :text
				link_to @text, @url
			when :print
				link_to @text, @url, :class => :print
			when :show
				link_to @text, @url, :class => :show
			when :edit	
				link_to @text, @url, :class => :edit
			when :destroy
				if @options[:remote]
					link_to @text, @url, :class => :destroy, :method => :delete, :data => { :confirm => @options[:confirm] }
				else
					link_to @text, @url, :class => :destroy
				end
			end
		end

	end

end