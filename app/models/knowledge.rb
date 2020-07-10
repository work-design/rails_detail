class Knowledge < ApplicationRecord
  include RailsDetail::Knowledge
  prepend RailsTaxon::Node
end unless defined? Knowledge
