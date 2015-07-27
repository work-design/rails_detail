class Knowledge < ActiveRecord::Base

  paginates_per 10

  belongs_to :user

  validates :name, presence: true



end


# :name, :string
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
