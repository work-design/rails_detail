module ContentModel
  extend ActiveSupport::Concern

  included do

    has_one :note, as: :detail
    has_many :pictures, as: :detail
    has_many :links, as: :detail
    has_one :major, as: :detail
    has_one :minor, as: :detail
  end


end

