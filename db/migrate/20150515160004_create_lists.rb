class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|

      t.timestamps null: false
    end

    create_table "items" do |t|
      t.column :list_id,        :integer
      t.column :list_name,      :string,  limit: 50
      t.column :name,           :string,  limit: 50
      t.column :content,        :text,    limit: 65535
      t.column :type,           :string,  limit: 10
      t.column :status,         :integer, default: 0
      t.column :node_type,      :integer
      t.column :children_count, :integer, default: 0
      t.column :picture_url,    :string,  limit: 255
    end


  end
end
