# aureus

_This project is not longer maintained._

**a framework for rails admin interfaces**

Aureus is a tool to quickly generate admin interfaces for a rails app.
It's between scaffolding and tools like ActiveAdmin.

## Sample Controller

The following Controller will render a finished interface:

```ruby
class ResourcesController < Aureus::ResourcesController
  before_filter :prepare_aureus

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    Resource.create!(permitted_params[:resource])
    redirect_to resources_url
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    resource = Resource.find(params[:id])
    resource.update!(permitted_params[:resource])
    redirect_to resource_url(resource)
  end

  def destroy
    resource = Resource.find(params[:id])
    resource.destroy!
    redirect_to resources_url
  end

  protected

  def prepare_aureus
    aureus({
      actions: [:index, :new, :create, :show, :edit, :update, :destroy],
      table_fields: [:id, :title, :text],
      form_fields: [:title, :text],
      item_fields: [:title, :text]
    })
  end

  def permitted_params
    params.permit(resource: [:title, :text])
  end
end
```

## Generators

The following generators are available:

* Run `rails g aureus:setup` to create the initializer.
* Run `rails g aureus:copy` to copy the views and layout.

