class Detail < ApplicationRecord

  paginates_per 10

  has_many :contents
  has_one :major
  has_one :minor
  validates :name, presence: true



end

# :name, :string
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
