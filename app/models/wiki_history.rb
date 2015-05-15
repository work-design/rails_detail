class WikiHistory < ActiveRecord::Base

  paginates_per 10

  belongs_to :user
  belongs_to :sort


end

=begin
create_table "wiki_histories", force: true do |t|
  t.text     "content",    limit: 65535
  t.string   "reason",     limit: 255
  t.integer  "wiki_id",    limit: 4
  t.integer  "user_id",    limit: 4
  t.datetime "created_at",               null: false
  t.datetime "updated_at",               null: false
end
=end