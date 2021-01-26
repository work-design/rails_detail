module Detail
  module Model::TaxonItem
    extend ActiveSupport::Concern

    included do
      attribute :default_value, :string

      belongs_to :taxon, polymorphic: true
      belongs_to :item
      belongs_to :list

      has_many :entity_items
    end

  end
end
