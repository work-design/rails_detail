module ContentModel
  extend ActiveSupport::Concern

  included do
    has_many :links
    Link.belongs_to :content, class_name: name

    has_many :pictures
    Picture.belongs_to :content, class_name: name
  end


end

