class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string		:name,						:limit => 20
      t.boolean		:marked_as_deleted,			:default => false
      t.timestamps
    end
  end
end
