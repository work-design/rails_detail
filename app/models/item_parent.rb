class ItemParent < ActiveRecord::Base

  belongs_to :item
  belongs_to :parent, class_name: 'Item', foreign_key: 'parent_id'

end

# :item_id, :integer
# :parent_id, :integer
