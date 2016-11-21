class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :elements, array: true
      t.string :css_id
      t.string :css_style
      t.timestamps null: false
    end

    remove_columns :page_parts, :
  end
end
