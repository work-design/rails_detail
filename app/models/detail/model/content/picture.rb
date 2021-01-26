module Detail
  module Model::Content::Picture
    extend ActiveSupport::Concern

    included do
      has_one_attached :file
    end

  end
end
