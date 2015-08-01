class Wiki < ActiveRecord::Base

  paginates_per 10

  belongs_to :knowledge
  belongs_to :commit, class_name: 'User', foreign_key: 'commit_id'
  validates :commit_id, presence: true

  after_save :move_to_wiki_histories, if: :body_changed?

  def move_to_wiki_histories
    history = WikiHistory.new
    history.wiki_id = self.id
    history.commit_id = self.commit_id
    history.commit_message = self.commit_message
    history.body = self.body
    history.save
  end

end

# :body, :text
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
