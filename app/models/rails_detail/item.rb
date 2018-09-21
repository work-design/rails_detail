class Item < ApplicationRecord
  belongs_to :list
  has_one_attached :logo


end

