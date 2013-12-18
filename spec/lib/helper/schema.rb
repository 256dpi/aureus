ActiveRecord::Schema.define version: 20120717133935 do
  create_table "resources", force: true do |t|
    t.string "title"
    t.string "text"
  end
end
