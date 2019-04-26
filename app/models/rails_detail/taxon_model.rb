module RailsDetail::TaxonModel
  extend ActiveSupport::Concern

  included do
    has_many :taxon_items, as: :taxon
  end

end

