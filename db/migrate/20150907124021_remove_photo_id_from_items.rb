class RemovePhotoIdFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :photo_id
    drop_table :item_children
    drop_table :item_parents

  end
end
