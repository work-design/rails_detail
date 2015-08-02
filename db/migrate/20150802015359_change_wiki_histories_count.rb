class ChangeWikiHistoriesCount < ActiveRecord::Migration
  def change
    change_column :knowledges, :wiki_histories_count, :integer, default: 0
  end
end
