class TaxonItem < ApplicationRecord
  belongs_to :taxon, polymorphic: true
  belongs_to :item
  belongs_to :list


  def item_options(list_id)
    item_ids = taxon.taxon_items.where(list_id: list_id).pluck(:item_id)
    Item.where(list_id: list_id).where.not(id: item_ids).pluck(:name, :id)
  end

end
