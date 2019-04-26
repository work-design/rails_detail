module RailsDetail::Content::Banner
  extend ActiveSupport::Concern
  included do
    has_one_attached :pic
  end

end


