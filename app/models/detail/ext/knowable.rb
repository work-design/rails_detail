module Detail
  module Ext::Knowable
    extend ActiveSupport::Concern

    included do
      has_many :knowings, as: :knowable, dependent: :destroy
      has_many :knowledges, through: :knowings

      has_one :knowing, as: :knowable
      has_one :knowledge, through: :knowing
    end

  end
end
