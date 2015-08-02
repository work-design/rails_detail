class AddMajorRecordsCountToKnow < ActiveRecord::Migration
  def change
    rename_column :knowledges, :wiki_records_count, :major_records_count
    add_column :knowledges, :minor_records_count, :integer, default: 0
  end
end
