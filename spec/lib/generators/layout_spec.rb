require 'spec_helper'

require_relative '../../../lib/generators/aureus/layout/layout_generator'

describe Aureus::Generators::LayoutGenerator do
  destination File.expand_path('../../../../tmp/gen', __FILE__)
  arguments ['application']

  before do
    prepare_destination
    run_generator
  end

  it 'creates view files' do
    assert_file 'app/views/layouts/application.html.haml'
  end
end
