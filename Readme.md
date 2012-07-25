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

## Helper Methods

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

	// Grid system
	= aureus_row do
		%strong only wrapper
	= aureus_row do |r|
		- r.column 100 do
			.one-column
	= aureus_row do |r|
		- r.column 2 do
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
	= aureus_box "a title", :centered => true, :for => :form do
		%li a entry
	= aureus_box "a title" do |b|
		- b.content do
			%strong the content
		- b.foot do
			%strong the footer

	// Datatables
	= aureus_datatable @resources do |t|
		- t.head do |h|
			- h.text "Title"
			- h.text "Text"
		- t.row do |r,res|
			- r.cell res.title
			- r.cell res.text
			- r.button :show, "url"
			- r.button :edit, "url"
			- r.button :destroy, "url", :confirm => "Delete user?"

	// Listings
	= aureus_listing do |l|
		- l.entry "head", "body"
		- l.entry "head2" do
			%strong body2

## The Layout

Here is a simple layout done with aureus helpers: