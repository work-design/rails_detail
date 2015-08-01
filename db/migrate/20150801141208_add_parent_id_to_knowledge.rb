class AddParentIdToKnowledge < ActiveRecord::Migration
  def change
    add_column :knowledges, :parent_id, :integer, default: 0
    drop_table :knowledge_items

    create_table :wikis do |t|
      t.integer :knowledge_id
      t.text :body
      t.string :comment, limit: 4096
      t.timestamps

    end

    create_table :wiki_histories do |t|
      t.integer :wiki_id
      t.integer :knowledge_id
      t.text :body
      t.string :comment, limit: 4096
      t.timestamps
    end

  end
end
