module RailsDetail::Knowledge
  extend ActiveSupport::Concern

  included do
    attribute :title, :string
    attribute :body, :text
    attribute :position, :integer

    belongs_to :detail, polymorphic: true
    has_many :contents, as: :detail
  end

end
