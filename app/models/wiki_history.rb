class WikiHistory < ActiveRecord::Base
  paginates_per 10

  belongs_to :wiki
  belongs_to :knowledge


end

# :item_id, :integer
# :user_id, :integer
# :content, :string, limit: 65535
# :comment, :string
