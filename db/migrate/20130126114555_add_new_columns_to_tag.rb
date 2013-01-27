class AddNewColumnsToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :status_id, :integer, :null => false
  end
end
