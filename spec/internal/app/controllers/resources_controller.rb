class ResourcesController < Aureus::ResourcesController
  before_filter :prepare_aureus

  def index
    aureus Resource.all, navigation_buttons: [['New Resource', new_resource_path]]
  end

  def new
    aureus Resource.new, title: 'New Resource'
  end

  def create
    Resource.create!(permitted_params[:resource])
    redirect_to resources_url
  end

  def show
    aureus Resource.find(params[:id]), navigation_buttons: [['Back', resources_path]]
  end

  def edit
    aureus Resource.find(params[:id]), title: 'New Resource'
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
    aureus_defaults({
      navigation_buttons: [['Cancel', resources_path]],
      form_inputs: [[:title], [:text]],
      table_cells: [
        ['ID', lambda{|r| r.id }],
        ['Title', lambda{|r| r.title }],
        ['Text', lambda{|r| r.text }]
      ],
      row_actions: [
        lambda{|r| [:show, resource_path(r)] },
        lambda{|r| [:edit, edit_resource_path(r)] },
        lambda{|r| [:destroy, resource_path(r), confirm: 'Really?'] },
      ],
      item_entries: [
        ['Title', lambda{|r| r.title }],
        ['Text', lambda{|r| r.text }]
      ]
    })
  end

  def permitted_params
    params.permit(resource: [:title, :text])
  end
end
