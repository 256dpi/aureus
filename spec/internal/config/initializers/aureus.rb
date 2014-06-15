Aureus.parent_controller = 'ApplicationController'

Aureus.toolbar_builder = lambda do |t|
  t.left do |l|
    l.link_to 'Resources', resources_path
  end
end
