class Category < ActiveRecord::Base
  belongs_to :site
  has_many :posts
end

#
# :categories
#
# :name, :string
# :site_id, :integer