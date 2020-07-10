module RailsDetail::ItemModel
  extend ActiveSupport::Concern

  included do
    has_many :entity_items, as: :entity
  end

  def items
    taxon_items = self.taxon.taxon_items

    taxon_items.each do |taxon_item|
      entity_item = entity_items.find { |entity_item| entity_item.taxon_item_id == taxon_item.id  }
      if entity_item
        taxon_item.value = entity_item.value
        taxon_item.entity_item_id = entity_item.id
      end
    end

    taxon_items.group_by(&:list)
  end


end

