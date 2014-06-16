class AureusController < Aureus.parent_controller.constantize
  before_filter :create_draft

  protected

  def create_draft
    @draft = Aureus::Draft.new()
  end
end
