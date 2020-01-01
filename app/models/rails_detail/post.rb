module RailsDetail::Post
  extend ActiveSupport::Concern

  included do
    attribute :type, :string
    attribute :title, :string
    attribute :content, :string
    attribute :link, :string
    attribute :code, :string
    attribute :synced, :json, default: {}, comment: '已同步至'
  end
  
end
