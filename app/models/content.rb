class Content < ApplicationRecord

  belongs_to :detail
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  has_many :links


end

# :picture_key, :string
# :title, :string
# :body, :text
# :detail_id, :integer
# :items_count, :integer, default: 0
