class Item < ActiveRecord::Base
  paginates_per 10
  mount_uploader :picture, PictureUploader

  belongs_to :list, :counter_cache => true

  has_many :parents, class_name: 'ItemParent', :dependent => :destroy
  has_many :children, class_name: 'ItemChild', :dependent => :destroy

  # enum
  # node_top => 根节点（无父节点）
  # node_mid => 中间节点（既有父节点，亦有子节点）
  # node_bottom => 底节点（无子节点）
  enum node_type: [:node_top, :node_mid, :node_bottom]
  scope :node_tops, -> { where(node_type: node_types[:node_top]) }

end

=begin

create_table "items", force: :cascade do |t|
  t.string   "name",           limit: 255
  t.string   "picture",        limit: 255
  t.integer  "list_id",        limit: 4
  t.string   "list_name",      limit: 255
  t.text     "content",        limit: 65535
  t.string   "type",           limit: 255
  t.integer  "status",         limit: 4,     default: 0
  t.integer  "node_type",      limit: 4
  t.integer  "children_count", limit: 4,     default: 0
  t.datetime "updated_at"
end

=end