class AllController < ActionController::Base

  def index
    render :index, layout: 'application'
  end

  def centered
    render :centered, layout: 'naked'
  end

end
