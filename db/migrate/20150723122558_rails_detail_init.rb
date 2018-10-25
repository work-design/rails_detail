class RailsDetailInit < ActiveRecord::Migration[5.2]
  def change

    create_table :contents do |t|
      t.string :type
      t.string :title
      t.text :body, limit: 65535
      t.integer :position, limit: 4, default: 1
      t.string :list, limit: 50
      t.references :detail, polymorphic: true
      t.references :author
      t.timestamps
    end

  end
end
