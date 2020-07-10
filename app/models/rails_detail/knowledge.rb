module RailsDetail::Knowledge
  extend ActiveSupport::Concern

  included do
    attribute :title, :string
    attribute :body, :text
    attribute :position, :integer

    has_many :contents, as: :detail
  end

end
