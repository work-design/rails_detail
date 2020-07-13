module RailsDetail::Knowable
  extend ActiveSupport::Concern

  included do
    has_many :knowings, as: :knowable, dependent: :destroy
    has_many :knowledges, through: :knowings
  end

end
