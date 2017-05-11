class Content < ApplicationRecord

  belongs_to :picture, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  belongs_to :describe, polymorphic: true
  has_many :links


end

# :body, :text
# :knowledge_id, :integer
# :items_count, :integer, default: 0
