class ResourcesController < Aureus::ResourcesController
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

  def permitted_params
    params.permit(resource: [:title, :text])
  end
end
