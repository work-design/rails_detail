module Detail
  module Model::Item
    extend ActiveSupport::Concern

    included do
      attribute :name, :string
      attribute :type, :string
      attribute :key, :string
      attribute :description, :string, limit: 1024

      belongs_to :list
      has_one_attached :logo
    end

  end
end
