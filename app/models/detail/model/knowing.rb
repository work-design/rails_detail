module Detail
  module Model::Knowing
    extend ActiveSupport::Concern

    included do
      attribute :primary, :boolean

      belongs_to :knowable, polymorphic: true
      belongs_to :knowledge
    end

  end
end
