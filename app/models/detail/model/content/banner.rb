module Detail
  module Model::Content::Banner
    extend ActiveSupport::Concern

    included do
      has_one_attached :pic
    end

  end
end
