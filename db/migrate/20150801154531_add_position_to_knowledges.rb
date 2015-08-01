class AddPositionToKnowledges < ActiveRecord::Migration
  def change
    add_column :knowledges, :position, :integer, default: 0
    add_column :wikis, :type, :string
  end
end
