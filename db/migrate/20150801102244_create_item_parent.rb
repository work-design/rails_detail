class CreateItemParent < ActiveRecord::Migration
  def change
    create_table :item_parents do |t|
      t.integer :item_id
      t.integer :parent_id
      t.timestamps
    end

    create_table :item_children do |t|
      t.integer :item_id
      t.integer :child_id
      t.timestamps
    end
  end
end
