require 'spec_helper'

describe 'Resources' do
  it 'renders index template properly' do
    get '/resources'
    expect(response).to render_template(:index)
  end

  it 'renders show template properly' do
    get '/resources/1'
    expect(response).to render_template(:show)
  end

  it 'renders new template properly' do
    get '/resources/new'
    expect(response).to render_template(:new)
  end

  it 'renders edit template properly' do
    get '/resources/1/edit'
    expect(response).to render_template(:edit)
  end
end
