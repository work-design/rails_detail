class EntityItem < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :taxon_item
  belongs_to :item
  belongs_to :list

  after_initialize if: :new_record? do |o|
    self.list_id = self.taxon_item.list_id
    self.item_id = self.taxon_item.item_id
  end

end
