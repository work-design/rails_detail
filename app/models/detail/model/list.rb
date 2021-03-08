module Detail
  module Model::List
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :status, :string
      attribute :position, :integer
      attribute :items_count, :integer, default: 0

      belongs_to :organ, class_name: 'Org::Organ', optional: true
      has_many :items
    end

  end
end
