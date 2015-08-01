class Wiki < ActiveRecord::Base

  paginates_per 10

  belongs_to :knowledge

  validates :name, presence: true

  after_save :move_to_wiki_histories

  def move_to_wiki_histories
    history = WikiHistory.new
    history.wiki_id = self.id
    history.user_id = self.user_id
    history.content = self.content
    history.reason = self.reason
    history.save
  end

end

# :body, :text
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
