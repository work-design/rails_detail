module RailsDetail::Post
  extend ActiveSupport::Concern

  included do
    attribute :title, :string
    attribute :content, :string
    attribute :link, :string
    attribute :code, :string

    has_many :post_syncs, dependent: :destroy, inverse_of: :post
  end

end
