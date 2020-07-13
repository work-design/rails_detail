module RailsDetail::Knowing
  extend ActiveSupport::Concern

  included do
    belongs_to :knowable, polymorphic: true
    belongs_to :knowledge
  end

end
