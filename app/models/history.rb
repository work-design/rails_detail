class History < ActiveRecord::Base
  paginates_per 10

  belongs_to :user
  belongs_to :item



end

# :item_id, :integer
# :user_id, :integer
# :content, :string, limit: 65535
# :comment, :string
