require 'spec_helper'

require_relative '../../internal/app/models/resource'
require_relative '../../internal/app/controllers/resources_controller'
require_relative '../../../lib/generators/aureus/views/views_generator'

describe Aureus::Generators::ViewsGenerator do
  destination File.expand_path('../../../../tmp', __FILE__)
  arguments ['Resource', 'ResourcesController', 'title text', '--yes']

  before do
    prepare_destination
    run_generator
  end

  it 'creates view files' do
    assert_file 'app/views/resources/index.html.haml'
    assert_file 'app/views/resources/show.html.haml'
    assert_file 'app/views/resources/edit.html.haml'
    assert_file 'app/views/resources/new.html.haml'
    assert_file 'app/views/resources/_form.html.haml'
    assert_file 'app/views/resources/_item.html.haml'
    assert_file 'app/views/resources/_list.html.haml'
    assert_file 'config/locales/en/resources.en.yml'
  end
end
