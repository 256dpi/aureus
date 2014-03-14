# aureus

**a framework for rails admin interfaces**

Aureus is a tool to quickly generate admin interfaces for a rails app.
It's between scaffolding and tools like ActiveAdmin.

## General Concept

The idea behind aureus is to abstract as much as possible of GUI rendering by still giving enough freedom for customization.
A typical aureus driven view would look like this:

```haml
= aureus_row do |r|
  = aureus_box 'Datatable' do
    = aureus_datatable Resource.all do |t|
      - t.head do |h|
        - h.text 'Title'
        - h.text 'Text'
      - t.row do |r,res|
        - r.identifier res.id
        - r.cell res.title
        - r.cell res.text
        - r.button :show, 'url'
        - r.button :edit, 'url'
        - r.button :destroy, 'url', confirm: 'Delete user?'
```

## Installation

To use **aureus** simply require the gem:

```ruby
gem 'aureus'
```

### Asset Pipeline

Aureus uses the rails asset pipeline to load and override the style and behavior.

Change your `application.scss` to match the following:

```scss
//= require aureus
//= require_self

@import 'aureus/skin/default';
@import 'aureus/theme';
```

Change your `application.js` to match the following:

```javascript
//= require aureus
//= require_self

$(function(){
  aureus({
    remove_messages_after: 2
  });
});
```

You can now use the aureus framework to rapidly build awesome interfaces!

## Helpers

There are several helper methods available to generate the interface:

```haml
// Toolbar
= aureus_toolbar 'A nice title' do |t|
  - t.left do |l|
    - l.link_to 'root', root_url
    - l.link_to 'an anchor', an_anchor_url
    - l.info 'cool'
    - l.dropdown 'a caption' do |d|
      - d.link_to 'an anchor', an_anchor_url
  - t.right do |r|
    - r.info 'some info'
    - r.link_to 'an anchor', some_other_controller_url

// Navigation
= aureus_navigation do |n|
  - n.title 'the title'
  - n.button link_to('target name',some_cool_url) if can? :read, Stuff
  - n.submit_form_button @post, 'save'

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
  - r.column 2 do # two '2 width' colums are the same like 50 / 50
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
= aureus_box 'a title' do
  %strong content
= aureus_box 'a title', centered: true, for: :form do
  %li a entry
= aureus_box 'a title' do |b|
  - b.button link_to('a button',cool_controller_url)
  - b.content do
    %strong the content
  - b.foot do
    %strong the footer

// Datatables
= aureus_datatable @resources do |t|
  - t.head do |h|
    - h.text 'Title'
    - h.text 'Text'
    - h.date 'Date'
    - h.raw 'Raw'
  - t.row do |r,res|
    - r.cell res.title
    - r.cell res.text
    - r.cell res.date
    - r.cell res.unsortable_data
    - r.button :show, 'url' if can? :show, Resource
    - r.button :edit, 'url'
    - r.button :destroy, 'url', confirm: 'Delete user?'
    - r.button_raw link_to('a action', the_action_url, class: ['icon','my-icon'])

// Forms
= aureus_form [@parent,@resource] do |f|
  = f.input :name # formtastic is here

// Listings
= aureus_listing do |l|
  - l.entry 'head', 'body'
  - l.entry 'head2' do
    %strong body2

// Maps (Google Maps iFrame)
= aureus_map longitude: 12, latitude: 6
```

## Generators

Aureus has a bunch of generators built-in to easily generate a complete interface.

### Layout & Views

* Run `rails g aureus:layout layout_name` to generate a typical aureus layout.
* Run `rails g aureus:views Resource ResourcesController` to generate aureus views for a model and controller.

### Devise

* Run `rails g aureus:devise_views folder` to generate views using aureus helpers.
* Run `rails g aureus:devise_i18n folder` to generate the i18n file used by the views.

* Run `rails g aureus:devise_invitable_views folder` to generate views using aureus helpers.
* Run `rails g aureus:devise_invitable_i18n folder` to generate the i18n file used by the views.
