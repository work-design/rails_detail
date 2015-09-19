class RenameWikiToContent < ActiveRecord::Migration
  def change
    rename_table :wikis, :contents
    remove_columns :contents, :commit_id, :commit_message
    drop_table :wiki_records
  end
end
