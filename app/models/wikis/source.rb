class Source < ActiveRecord::Base

end

=begin

create_table "sources", force: true do |t|
  t.integer  "mum",        limit: 4
  t.string   "headline",   limit: 255
  t.string   "url",        limit: 255
  t.datetime "created_at",             null: false
  t.datetime "updated_at",             null: false
end

=end