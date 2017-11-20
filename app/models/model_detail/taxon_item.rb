class TaxonItem < ApplicationRecord
  belongs_to :taxon, polymorphic: true
  belongs_to :item
  belongs_to :list

end
