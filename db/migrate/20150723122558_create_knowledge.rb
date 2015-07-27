class CreateKnowledge < ActiveRecord::Migration
  def change
    create_table :knowledges do |t|
      t.string :name
      t.integer :items_count, default: 0
      t.timestamps null: false
    end
  end
end
