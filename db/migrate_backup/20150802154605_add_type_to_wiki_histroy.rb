class AddTypeToWikiHistroy < ActiveRecord::Migration
  def change
    rename_table :wiki_histories, :wiki_records
    add_column :wiki_records, :type, :string
    add_column :knowledges, :photo_id, :string
    rename_column :knowledges, :wiki_histories_count, :wiki_records_count
  end
end
