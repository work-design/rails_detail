class WikiRecord < ActiveRecord::Base
  paginates_per 10

  belongs_to :wiki
  belongs_to :knowledge
  belongs_to :commit, class_name: 'User', foreign_key: 'commit_id'
  validates :commit_id, presence: true

  enum status: [:status_initial, :status_passed]

  default_scope -> { order(id: :desc) }
  def set_active
    self.class.where.not(id: self.id).where(knowledge_id: self.knowledge_id).update_all(active: false)
    self.update(active: true)
    move_to_wiki
  end

end

# :item_id, :integer
# :user_id, :integer
# :content, :string, limit: 65535
# :comment, :string
