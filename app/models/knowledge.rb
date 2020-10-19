class Knowledge < ApplicationRecord
  include RailsDetail::Knowledge
  include RailsCom::Taxon
end unless defined? Knowledge
