require 'spec_helper'

require_relative '../../../lib/generators/aureus/copy/copy_generator'

describe Aureus::Generators::CopyGenerator, type: :generator do
  destination File.expand_path('../../../../tmp/gen', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'copies views and layout' do
    assert_file 'app/views/aureus/resources/index.html.haml'
    assert_file 'app/layouts/aureus.html.haml'
  end
end
