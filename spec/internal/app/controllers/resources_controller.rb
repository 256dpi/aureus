class ResourcesController < Aureus::ResourcesController
  before_filter :prepare_aureus

  def index
    aureus Resource.all
  end

  def new
    aureus Resource.new
  end

  def create
    Resource.create!(permitted_params[:resource])
    redirect_to resources_url
  end

  def show
    aureus Resource.find(params[:id])
  end

  def edit
    aureus Resource.find(params[:id])
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
    aureus_initialize({
      actions: [:index, :new, :create, :show, :update, :destroy],
      table_fields: [:id, :title, :text],
      form_fields: [:title, :text],
      item_fields: [:title, :text]
    })
  end

  def permitted_params
    params.permit(resource: [:title, :text])
  end
end
