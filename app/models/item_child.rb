class ItemChild < ActiveRecord::Base

  belongs_to :item
  belongs_to :child, class_name: 'Item', foreign_key: 'child_id'

end

# :item_id, :integer
# :child_id, :integer

