class AllController < ActionController::Base
  def index
    flash[:notice] = 'Notice'
    flash[:error] = 'Error'
    flash[:alert] = 'Alert'
    render :index, layout: 'application'
  end

  def centered
    render :centered, layout: 'naked'
  end
end
