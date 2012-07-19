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
    %title Electric Feel
    = stylesheet_link_tag "system"
    = javascript_include_tag "system/all"
    = csrf_meta_tag
  %body
    - if administrator_signed_in?
      = aureus_toolbar "Electric Feel" do |t|
        - t.left do |l|
          - l.button link_to "Dashboard", system_root_url
          - l.button link_to "Users", system_users_url
        - t.right do |r|
          - r.info current_administrator.surname+" "+current_administrator.lastname
          - r.button link_to "Log Out", destroy_administrator_session_url, :method => :delete
    = yield :navigation
    = aureus_messages flash
    = aureus_content yield
````