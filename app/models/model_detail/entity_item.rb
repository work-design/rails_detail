class EntityItem < ApplicationRecord
  belongs_to :entity, polymorphic: true
  belongs_to :item
  belongs_to :list

end
