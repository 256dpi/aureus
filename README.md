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
//= depend_on aureus/theme1
//= require_self

@import 'aureus/theme1';
```

Change your `application.js` to match the following:

```javascript
//= require jquery
//= require jquery_ujs
//= require leaflet
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

### Layout

Run `rails g aureus:layout layout_name` to generate a layout typical file:

```haml
!!! 5
%html
  %head
    %meta{ charset: 'utf-8' }/
    %title= t('.title')
    = stylesheet_link_tag 'application'
    = javascript_include_tag 'application'
    = csrf_meta_tag
  %body
    = aureus_toolbar t('.title') do |t|
      - t.left do |l|
        - l.link_to t('.root'), root_url
      - t.right do |r|
        - r.info 'info'
    = yield :navigation
    = aureus_messages flash
    = aureus_content yield
```

### Views

Run `rails g aureus:views Resource ResourcesController` to generate views for a model and its controller:

#### app/views/resources/index.html.haml

```haml
- content_for :navigation do
  = aureus_navigation do |n|
    - n.title t('.title')
    - n.button link_to(t('.button_new'), new_resource_url) if can? :create, Resource

= render 'list'
```

#### app/views/resources/show.html.haml

```haml
- content_for :navigation do
  = aureus_navigation do |n|
    - n.title t('.title')
    - n.button link_to(t('.button_edit'), edit_resource_url(@resource)) if can? :update, Resource
    - n.button link_to(t('.button_back'),resources_url) if can? :index, Resource

= render 'item'
```

#### app/views/resources/new.html.haml

```haml
- content_for :navigation do
  = aureus_navigation do |n|
    - n.title t('.title')
    - n.button link_to(t('.button_cancel'), resources_url) if can? :index, Resource
    - n.submit_form_button @resource, t('.button_save') if can? :create, Resource

= render 'form'
```

#### app/views/resources/edit.html.haml

```haml
- content_for :navigation do
  = aureus_navigation do |n|
    - n.title t('.title')
    - n.button link_to t('.button_cancel'), resources_url if can? :show, Resource
    - n.submit_form_button @resource, t('.button_save') if can? :update, Resource

= render 'form'
```

#### app/views/resources/_list.html.haml

```haml
= aureus_row do
  = aureus_box t('.box_title') do
    = aureus_datatable @resources do |t|
      - t.head do |h|
        - h.text t('.column_id')
        - h.text t('.column_name')
        - h.text t('.column_body')
        - h.text t('.column_description')
        - h.text t('.column_created_at')
        - h.text t('.column_updated_at')
      - t.row do |r,resource|
        - r.cell resource.id
        - r.cell resource.name
        - r.cell resource.body
        - r.cell resource.description
        - r.cell resource.created_at
        - r.cell resource.updated_at
        - r.button :show, resource_url(resource) if can? :show, Resource
        - r.button :edit, edit_resource_url(resource) if can? :edit, Resource
        - r.button :destroy, resource_url(resource), confirm: t('.destroy_confirm') if can? :destroy, Resource
```

#### app/views/resources/_form.html.haml

```haml
= aureus_form [@resource] do |f|
  = aureus_row do |r|
    - r.column 25 do
      = aureus_box t('.box_title'), for: :form do
        = f.input :name, label: t('.field_name')
        = f.input :body, label: t('.field_body')
        = f.input :description, label: t('.field_description')
    - r.space 75
```

#### app/views/resources/_item.html.haml

```haml
= aureus_row do |r|
  - r.column 25 do
    = aureus_box t('.box_title') do
      = aureus_listing do |l|
        - l.entry t('.entry_id'), @resource.id
        - l.entry t('.entry_name'), @resource.name
        - l.entry t('.entry_body'), @resource.body
        - l.entry t('.entry_description'), @resource.description
        - l.entry t('.entry_created_at'), @resource.created_at
        - l.entry t('.entry_updated_at'), @resource.updated_at
  - r.space 75
```

#### config/locales/resources.en.yml

```yaml
en:
  resources:
    index:
      title: Resources
      button_new: Add Resource
    new:
      title: New Resource
      button_cancel: Cancel
      button_save: Save
    edit:
      title: Edit Resource
      button_cancel: Cancel
      button_save: Save
    form:
      box_title: Details
      field_id: Id
      field_name: Name
      field_body: Body
      field_description: Description
      field_created_at: Created At
      field_updated_at: Updated At
    list:
      box_title: Resources Listing
      destroy_confirm: Really want to delete the Resource?
      column_id: Id
      column_name: Name
      column_body: Body
      column_description: Description
      column_created_at: Created At
      column_updated_at: Updated At
    show:
      title: Resource
      button_edit: Edit Resource
      button_back: Back
    item:
      box_title: Details
      entry_id: Id
      entry_name: Name
      entry_body: Body
      entry_description: Description
      entry_created_at: Created At
      entry_updated_at: Updated At
```

### Devise

* Run `rails g aureus:devise_views folder` to generate views using aureus helpers.
* Run `rails g aureus:devise_i18n folder` to generate the i18n file used by the views.

* Run `rails g aureus:devise_invitable_views folder` to generate views using aureus helpers.
* Run `rails g aureus:devise_invitable_i18n folder` to generate the i18n file used by the views.
