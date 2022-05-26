module Detail
  module Ext::ContentModel
    extend ActiveSupport::Concern

    included do
      has_one :note, class_name: 'Detail::Note', as: :detail
      has_one :major, class_name: 'Detail::Major', as: :detail
      has_one :minor, class_name: 'Detail::Minor', as: :detail
      has_many :pictures, as: :detail
      has_many :links, as: :detail
    end

  end
end
