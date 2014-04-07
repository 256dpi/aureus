ActiveRecord::Schema.define do
  create_table 'resources', force: true do |t|
    t.string 'title'
    t.string 'text'
  end
end

5.times do
  Resource.create! title: 'the title', text: 'some long text'
end
