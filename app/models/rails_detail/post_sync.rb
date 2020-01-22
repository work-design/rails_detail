module RailsDetail::PostSync
  extend ActiveSupport::Concern
  included do
    belongs_to :post, inverse_of: :post_syncs
    belongs_to :synced, polymorphic: true

    attribute :source_id, :string
    attribute :synced_at, :datetime
  end

end
