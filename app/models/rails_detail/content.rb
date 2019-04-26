module RailsDetail::Content
  extend ActiveSupport::Concern
  included do
    belongs_to :detail, polymorphic: true
    belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  end
  
end

# :picture_key, :string
# :title, :string
# :body, :text
# :knowable_id, :integer
# :knowable_type, :string
# :items_count, :integer, default: 0
