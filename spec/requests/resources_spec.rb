require 'spec_helper'

describe 'Resources' do
  it 'renders all templates properly' do
    get '/resources'
    expect(response).to render_template(:index)

    get '/resources/1'
    expect(response).to render_template(:show)

    get '/resources/new'
    expect(response).to render_template(:new)

    get '/resources/1/edit'
    expect(response).to render_template(:edit)
  end
end
