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

    @aureus[:row_actions] << lambda{|r| ['hello', path_for(:show, r.id)] }
  end

  def permitted_params
    params.permit(resource: [:title, :text])
  end
end
