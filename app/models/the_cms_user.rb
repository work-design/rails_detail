module TheCmsUser
  extend ActiveSupport::Concern

  included do
    has_many :sites
    has_one :site, -> { where(current: true) }
  end

end