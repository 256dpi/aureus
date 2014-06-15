require 'spec_helper'

describe 'Templates' do
  it 'renders all templates properly' do
    get '/'
    expect(response).to render_template(:index)
    get '/centered'
    expect(response).to render_template(:centered)
  end
end
