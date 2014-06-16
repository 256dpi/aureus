module Aureus
  module DraftHelper
    def draft(key, context={})
      @draft.get(key, { action: params[:action], controller: params[:controller] }.merge(context))
    end
  end
end
