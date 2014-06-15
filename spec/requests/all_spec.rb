require 'spec_helper'

describe 'Templates' do
  it 'renders the main template properly' do
    get '/'
    expect(response).to render_template(:index)
  end

  it 'renders the centered template properly' do
    get '/centered'
    expect(response).to render_template(:centered)
  end
end
