module ContentModel
  extend ActiveSupport::Concern

  included do
    has_many :entity_items, as: :entity
  end


end

