class AddActiveToWikis < ActiveRecord::Migration
  def change
    add_column :wiki_histories, :active, :boolean, default: false
    add_column :wiki_histories, :status, :integer, default: 0
  end
end
