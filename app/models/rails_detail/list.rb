module RailsDetail::List
  extend ActiveSupport::Concern
  
  included do
    attribute :name, :string
    attribute :status, :string
    attribute :position, :integer
    attribute :items_count, :integer, default: 0
    
    has_many :items
  end

end

