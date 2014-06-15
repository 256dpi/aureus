require 'spec_helper'

require_relative '../../../lib/generators/aureus/setup/setup_generator'

describe Aureus::Generators::SetupGenerator do
  destination File.expand_path('../../../../tmp/gen', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'creates initializer file' do
    assert_file 'config/initializers/aureus.rb'
  end
end
