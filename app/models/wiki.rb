class Wiki < ActiveRecord::Base

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
