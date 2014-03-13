require 'spec_helper'

describe AllController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

describe AllController do
  describe 'GET centered' do
    it 'renders the centered template' do
      get :centered
      expect(response).to render_template('centered')
    end
  end
end
