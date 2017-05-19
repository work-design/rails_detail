module ContentModel
  extend ActiveSupport::Concern

  included do
    belongs_to :detail, dependent: :destroy, autosave: true
  end

  def get_detail
    detail || build_detail
    save
    detail
  end


end

