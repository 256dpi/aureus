# Aureus Admin Template

**a nice looking css framework for your rails admin interfaces**

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

## The Layout

Here is a simple layout done with aureus helpers:

````haml
!!! 5
%html
  %head
    %meta{ :charset => "utf-8" }/
    %title My Application
    = stylesheet_link_tag "application"
    = javascript_include_tag "application"
    = csrf_meta_tag
  %body
    - if user_signed_in?
      = aureus_toolbar "My Application" do |t|
        - t.left do |l|
          - l.button link_to "Dashboard", system_root_url
          - l.button link_to "Users", system_users_url
        - t.right do |r|
          - r.info current_user.full_name
          - r.button link_to "Log Out", destroy_user_session_url, :method => :delete
    = yield :navigation
    = aureus_messages flash
    = aureus_content yield
```