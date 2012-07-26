# Aureus

**a nice looking css framework for your rails admin interfaces**

Aureus is a tool to quickly generate admin interfaces for a rails app. It's between scaffolding and tools like ActiveAdmin.

## Installation

To use **aureus** simply require the gem:

	gem "aureus"

The rails engine will automatically load the following dependencies:
	
* formtastic
* haml
* jquery-rails

But you have to ensure that these gems are available:

* sass-rails
* coffee-rails

## Asset Pipeline

Aureus uses the rails asset pipeline to load and override the style and behavior.

This is the basic application.scss setup:

	/*
	*= require_self
	*= depend_on aureus
	*/

	$color_main: #0f0; // the color used for highlights
	$color_warn: $f00; // the color used for warning (should be red)

	@import "aureus";

	// your styles here ...

Configure the scripts in application.js:

	//= require_self
	//= require aureus

	var datepickerConfiguration = {
	  dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'],
	  monthNames: ['Januar','Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','December'],
	  nextText: "&rarr;",
	  prevText: "&larr;",
	  dateFormat: "yy-mm-dd",
	  firstDay: 1,
	}

	var timepickerConfiguration = {
	  isoTime: true,
	  minTime: {hour:6,minute:0},
	  maxTime: {hour:22,minute:0},
	  timInterval: 30
	}

	var tooltipConfiguration = {
	  background: "none",
	  color: 'black',
	  border: "none"
	}

## Helpers

There are several helper methods available to generate the interface:

	// Toolbar
	= aureus_toolbar "A nice title" do |t|
		- t.left do |l|
			- l.link_to "an anchor", "http://www.example.com"
			- l.link_to "an anchor", "http://www.example.com"
			- l.info "cool"
		- t.right do |r|
			- r.info "some info"
			- r.link_to "an anchor", "http://www.example.com"

	// Navigation
	= aureus_navigation do |n|
		- n.title "the title"
		- n.button link_to("target name",some_cool_url) if can? :read, Stuff
		- n.submit_form_button @post, "save"

	// Flash messages
	= aureus_messages flash

	// Content wrapper for layout
	= aureus_content yield

	// Grid system (with automatic proportion calculation)
	= aureus_row do
		%strong only wrapper
	= aureus_row do |r|
		- r.column 100 do
			.one-column
	= aureus_row do |r|
		- r.column 2 do // two '2 width' colums are the same like 50 / 50
			.first
		- r.space 2
	= aureus_row do |r|
		- r.column 25 do
			.first
		- r.column 25 do
			.second
		- r.column 50 do
			.third

	// Boxes
	= aureus_box "a title" do
		%strong content
	= aureus_box "a title", :centered => true, :for => :form do
		%li a entry
	= aureus_box "a title" do |b|
		- b.button link_to("a button",cool_controller_url)
		- b.content do
			%strong the content
		- b.foot do
			%strong the footer

	// Datatables
	= aureus_datatable @resources do |t|
		- t.head do |h|
			- h.text "Title"
			- h.text "Text"
			- h.date "Date"
			- h.raw "Raw"
		- t.row do |r,res|
			- r.cell res.title
			- r.cell res.text
			- r.cell res.date
			- r.cell res.unsortable_data
			- r.button :show, "url" if can? :show, Resource
			- r.button :edit, "url"
			- r.button :destroy, "url", :confirm => "Delete user?"
			- r.button_raw link_to(...,..., :class => ["icon","my-icon"])

	// Forms
	= aureus_form [@parent,@resource] do |f|
		= f.input :name // formtastic

	// Listings
	= aureus_listing do |l|
		- l.entry "head", "body"
		- l.entry "head2" do
			%strong body2

	// Maps (Google Maps iFrame)
	= aureus_map :longitude => 12, :latitude => 6

## Generators

Aureus has a bunch of generators builtin to easily generate a complete interface including i18n.

### Layout

To generate a base layout issue `rails g aureus:layout layout_name` which produces:

	!!! 5
	%html
	  %head
	    %meta{ :charset => "utf-8" }/
	    %title= t(".title")
	    = stylesheet_link_tag "application"
	    = javascript_include_tag "application"
	    = csrf_meta_tag
	  %body
	    = aureus_toolbar t(".title") do |t|
	      - t.left do |l|
	        - l.link_to t(".root"), root_url
	      - t.right do |r|
	        - r.info "info"
	    = yield :navigation
	    = aureus_messages flash
	    = aureus_content yield

### Views

The awesome thing about aureus is the following generator `rails g aureus:views Resource ResourcesController` which generates all views and i18n files for you. It uses your ActiveRecord model to determine all attributes and uses the controller name for proper folders. The above command will generate:

#### /app/views/namespace/resources/index.html.haml

	- content_for :navigation do
	  = aureus_navigation do |n|
	    - n.title t(".title")
	    - n.button link_to(t(".button_new"), new_resource_url) if can? :create, Resource

	= render "list"









