module Detail
  module Model::Post
    extend ActiveSupport::Concern

    included do
      attribute :title, :string
      attribute :content, :string
      attribute :link, :string
      attribute :code, :string

      belongs_to :organ, optional: true
      has_many :post_syncs, dependent: :destroy
    end

  end
end
