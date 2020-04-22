class Item < ApplicationRecord
  include RailsDetail::Item
end unless defined? Item
