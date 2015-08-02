class Knowledge < ActiveRecord::Base

  paginates_per 10

  scope :roots, -> { where(parent_id: 0) }


  belongs_to :parent, class_name: Knowledge, foreign_key: 'parent_id', inverse_of: :children
  has_many :children, class_name: Knowledge, foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent

  has_one :major
  has_one :minor
  has_one :wiki
  has_many :major_records
  has_many :minor_records
  has_many :wiki_records
  validates :name, presence: true



end

# :name, :string
# :knowable_type, :string
# :knowable_id, :integer
# :items_count, :integer, default: 0
