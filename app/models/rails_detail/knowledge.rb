module RailsDetail::Knowledge
  extend ActiveSupport::Concern

  included do
    attribute :title, :string
    attribute :body, :text
    attribute :position, :integer

    belongs_to :knowable, polymorphic: true, optional: true
    has_many :contents, as: :detail

    has_one_attached :main_image
  end

end
