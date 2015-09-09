class CreateKonwledageItems < ActiveRecord::Migration
  def change
    create_table :konwledge_items do |t|
      t.integer :knowledge_id
      t.integer :item_id
      t.integer :item_group_id
      t.string :value
      t.timestamps null: false
    end

    create_table :item_groups do |t|
      t.integer :item_id
      t.integer :list_id
      t.string :start_value
      t.string :finish_value
      t.timestamps null: false
    end

    remove_column :items, :content
  end
end
