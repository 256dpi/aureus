require 'spec_helper'

require_relative '../../../lib/generators/aureus/devise_invitable_views/devise_invitable_views_generator'

describe Aureus::Generators::DeviseInvitableViewsGenerator do
  destination File.expand_path('../../../../tmp/gen', __FILE__)
  arguments ['devise']

  before do
    prepare_destination
    run_generator
  end

  it 'creates view files' do
    assert_file 'app/views/devise/invitations/edit.html.haml'
    assert_file 'app/views/devise/invitations/new.html.haml'
    assert_file 'app/views/devise/mailer/invitation_instructions.html.haml'
  end
end
