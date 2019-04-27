module RailsDetail::EntityItem
  extend ActiveSupport::Concern
  included do
    belongs_to :entity, polymorphic: true
    belongs_to :taxon_item
    belongs_to :item
    belongs_to :list
  
    after_initialize if: :new_record? do |o|
      self.list_id = self.taxon_item.list_id
      self.item_id = self.taxon_item.item_id
    end
  end
  
  def taxon_item
    _taxon_item = super
    _taxon_item.value = self.value
    _taxon_item
  end

end
