module RailsDetail::List
  extend ActiveSupport::Concern
  included do
    has_many :items
  end

end

