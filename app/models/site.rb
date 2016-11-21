class Site < ActiveRecord::Base
  default_scope -> { order(id: :asc) }

  belongs_to :user
  has_many :pages
  has_many :navigations

  validates :user_id, presence: true
  validates :name, uniqueness: { scope: :user_id }

  def set_current
    self.class.transaction do
      self.update!(current: true)
      self.class.where.not(id: self.id).where(user_id: self.user_id).update_all(current: false)
    end
  end

  serialize :preferences


  def to_s
    name
  end

  def content(layout_part)
    layout_part = layout_parts.where(name: layout_part).first
    layout_part.try(:content)
  end

  private

  def bootstrap_pages(theme)
    find_or_create_custom_pages(theme)
    deactivate_unused_view_templates(theme)
    activate_used_view_templates(theme)
  end

  def find_or_create_custom_pages(theme)
    theme.config.custom_pages.each do |page|
      Page.where(name: page[:name], deletable: false).first_or_create(title: page[:title], view_template: page[:view_template]).activate!
    end
  end

  def deactivate_unused_view_templates(theme)
    Page.where.not(view_template: theme.config.view_templates.map{|t|t[0]}).each &:deactivate!
  end

  def activate_used_view_templates(theme)
    Page.where(view_template: theme.config.view_templates.map{|t|t[0]}).each &:activate!
  end

  def self.serialized_attr_accessor(*args)
    args.each do |method_name|
      eval "
        def #{method_name}
          (self.preferences || {})[:#{method_name}]
        end

        def #{method_name}=(value)
          self.preferences ||= {}
          self.preferences[:#{method_name}] = value
        end
      "
    end
  end

  serialized_attr_accessor :google_analytics, :google_site_verification, :facebook, :twitter, :google_plus, :theme, :aviary_api_key, :aviary_language, :ngrok_address


end
#
# sites
#
# :user_id, :integer
# :name, :string
#