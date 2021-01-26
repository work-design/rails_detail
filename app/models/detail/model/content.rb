module Detail
  module Model::Content
    extend ActiveSupport::Concern

    included do
      attribute :type, :string
      attribute :title, :string
      attribute :body, :text, limit: 65535
      attribute :position, :integer
      attribute :list, :string

      belongs_to :detail, polymorphic: true
      belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
    end

  end
end
