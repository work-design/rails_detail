module ItemModel
  extend ActiveSupport::Concern

  included do
    has_many :entity_items, as: :entity
  end

  def items
    taxon_items = self.taxon.taxon_items

    taxon_items.each do |taxon_item|
      entity_item = entity_items.find { |entity_item| entity_item.taxon_item_id == taxon_item.id  }
      taxon_item.value = entity_item.value if entity_item
    end

    taxon_items.group_by { |i| i.list }
  end


end

