class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :custom_values

  accepts_nested_attributes_for :custom_values

  validates :title, presence: true
  validates :content, presence: true
end


# posts
# :title, :string
# :body, :text
#