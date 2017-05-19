class Detail < ApplicationRecord
  paginates_per 10

  has_many :contents
  has_many :pictures
  has_many :links
  has_one :major
  has_one :minor


end

# :name, :string
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
