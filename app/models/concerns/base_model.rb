module GoodItem

  included do
    mount_uploader :picture, PictureUploader

    belongs_to :item
    belongs_to :good
    belongs_to :list

    default_scope -> { order(position: :asc) }
    scope :the_list, ->(list_id){ where(list_id: list_id) }

    before_save :update_list_id
  end

  def update_list_id
    self.list_id = self.item.list_id
  end

end

=begin
good_id
item_id

自定义部分：
picture
value
position
=end
