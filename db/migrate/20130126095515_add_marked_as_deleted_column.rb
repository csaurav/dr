class AddMarkedAsDeletedColumn < ActiveRecord::Migration
  def up
  	add_column :domains, :marked_as_deleted, :boolean, :default => false
  	add_column :tags, :marked_as_deleted, :boolean, :default => false
  end

  def down
  	remove_column :domains, :marked_as_deleted
  	remove_column :tags, :marked_as_deleted
  end
end
