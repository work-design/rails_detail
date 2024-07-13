module Detail
  module Model::Knowledge
    extend ActiveSupport::Concern

    included do
      attribute :title, :string
      attribute :body, :text
      attribute :position, :integer

      has_many :knowings, dependent: :destroy

      has_one_attached :main_image
    end

  end
end
