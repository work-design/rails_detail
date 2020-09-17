class Knowledge < ApplicationRecord
  include RailsDetail::Knowledge
  include RailsTaxon::Node
end unless defined? Knowledge
