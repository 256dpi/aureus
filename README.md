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

## Generators

Aureus has a bunch of generators built-in to easily generate a complete interface.

### Layout & Views

* Run `rails g aureus:layout application` to generate a typical aureus layout.
* Run `rails g aureus:views Resource ResourcesController` to generate aureus views for a model and controller.

