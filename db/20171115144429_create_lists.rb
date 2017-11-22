class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :position, defalut: 1
      t.integer :items_count, default: 0
      t.integer :status, default: 0
      t.timestamps
    end

    create_table :items do |t|
      t.references :list
      t.string :name
      t.string :logo
      t.string :type
      t.string :key
      t.string :desc, limit: 1024
      t.timestamps
    end

    create_table :taxon_items do |t|
      t.references :taxon, polymorphic: true
      t.references :list
      t.references :item
      t.timestamps
    end

    create_table :entity_items do |t|
      t.references :entity, polymorphic: true
      t.references :list
      t.references :item
      t.string :value
      t.timestamps
    end

  end
end


