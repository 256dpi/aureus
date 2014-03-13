require 'spec_helper'

require_relative '../../../lib/generators/aureus/devise_views/devise_views_generator'

describe Aureus::Generators::DeviseViewsGenerator do
  destination File.expand_path('../../../../tmp/gen', __FILE__)
  arguments ['devise']

  before do
    prepare_destination
    run_generator
  end

  it 'creates view files' do
    assert_file 'app/views/devise/confirmations/new.html.haml'
    assert_file 'app/views/devise/mailer/confirmation_instructions.html.haml'
    assert_file 'app/views/devise/mailer/reset_password_instructions.html.haml'
    assert_file 'app/views/devise/mailer/unlock_instructions.html.haml'
    assert_file 'app/views/devise/passwords/edit.html.haml'
    assert_file 'app/views/devise/passwords/new.html.haml'
    assert_file 'app/views/devise/sessions/new.html.haml'
    assert_file 'app/views/devise/shared/_links.html.haml'
    assert_file 'app/views/devise/unlocks/new.html.haml'
  end
end
