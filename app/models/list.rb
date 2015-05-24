class List < ActiveRecord::Base

  KINDS = [
    ['目录', 'kind_menu'],
    ['非目录', 'kind_define']
  ]

  enum kind: [:kind_menu, :kind_define]

  has_many :items

  default_scope -> { order('position ASC') }
  scope :kind_menus, -> { where(kind: kinds[:kind_menu]) }


  def kind_name
    case kind
      when 'kind_menu' then '目录'
      when 'kind_define' then '非目录'
    end
  end

end

# :name, :string, limit: 255
# :items_count, :integer, limit: 4, default: 0
# :position, :integer, limit: 4, default: 0
# :kind, :integer, limit: 4
