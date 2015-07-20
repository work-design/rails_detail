class Knowledge < ActiveRecord::Base

  paginates_per 10

  belongs_to :user

  validates :name, presence: true

  after_save :move_to_wiki_histories

  def move_to_wiki_histories
    history = WikiHistory.new
    history.content = self.content
    history.reason = self.reason
    history.wiki_id = self.id
    history.user_id = self.user_id
    history.save
  end

end



# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0


  t.text     "content",              limit: 65535
  t.string   "reason",               limit: 255
  t.datetime "created_at",                                      null: false
  t.datetime "updated_at",                                      null: false
  t.string   "picture",              limit: 255
  t.integer  "wiki_histories_count", limit: 4,     default: 0
