class AddColumnToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :commit_id, :integer
    rename_column :wikis, :comment, :commit_message
    rename_column :wiki_histories, :comment, :commit_message
    add_column :wiki_histories, :commit_id, :integer
  end
end
