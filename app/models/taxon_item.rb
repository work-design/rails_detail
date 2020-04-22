class TaxonItem < ApplicationRecord
  include RailsDetail::TaxonItem

end unless defined? TaxonItem
