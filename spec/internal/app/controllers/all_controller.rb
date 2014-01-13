class AllController < ActionController::Base

  def index
    render :index, layout: 'application'
  end

end
