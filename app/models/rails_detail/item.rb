module RailsDetail::Item
  extend ActiveSupport::Concern
  included do
    belongs_to :list
    has_one_attached :logo
  end

end

