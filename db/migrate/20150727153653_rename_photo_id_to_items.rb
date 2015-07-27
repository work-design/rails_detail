class RenamePhotoIdToItems < ActiveRecord::Migration
  def change
    rename_column :items, :picture_url, :photo_id
    create_table :knowledge_items do |t|
      t.integer :knowledge_id
      t.integer :item_id
      t.string :photo_id
      t.text :content
      t.timestamps null: false
    end
  end
end
