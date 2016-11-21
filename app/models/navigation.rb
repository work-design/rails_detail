class Navigation < ActiveRecord::Base
  acts_as_list scope: [:parent_id]

  belongs_to :site
  belongs_to :page
  has_many :children, class_name: 'Navigation', foreign_key: :parent_id, dependent: :nullify, inverse_of: :parent
  belongs_to :parent, class_name: 'Navigation', foreign_key: :parent_id, inverse_of: :children

end

# navigations
#
# :site_id, :integer
# :page_id, :integer
# :title, :string
#