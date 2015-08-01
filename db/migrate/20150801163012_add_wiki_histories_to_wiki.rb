class AddWikiHistoriesToWiki < ActiveRecord::Migration
  def change
    add_column :knowledges, :wiki_histories_count, :integer
  end
end
