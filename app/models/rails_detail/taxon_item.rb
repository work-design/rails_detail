module RailsDetail::TaxonItem
  extend ActiveSupport::Concern

  included do
    belongs_to :taxon, polymorphic: true
    belongs_to :item
    belongs_to :list

    has_many :entity_items
  end

end
