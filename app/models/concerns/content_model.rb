module ContentModel
  extend ActiveSupport::Concern

  included do
    has_many :links, foreign_key: :content_id, dependent: :destroy
    Link.belongs_to :content, class_name: name

    has_many :pictures, foreign_key: :content_id, dependent: :destroy
    Picture.belongs_to :content, class_name: name


    accepts_nested_attributes_for :links, :pictures, allow_destroy: true

  end


end

