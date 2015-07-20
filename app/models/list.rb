class List < ActiveRecord::Base

  enum kind: [:kind_menu, :kind_define]

  has_many :items

  default_scope -> { order('position ASC') }
  scope :kind_menus, -> { where(kind: kinds[:kind_menu]) }



end

# :name, :string, limit: 255
# :items_count, :integer, limit: 4, default: 0
# :position, :integer, limit: 4, default: 0
