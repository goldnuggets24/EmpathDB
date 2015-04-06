class AddTimeRangeTousers < ActiveRecord::Migration
  def self.up
  	add_column :users, :time_range, :string
  end
  def self.down
  	remove_column :users, :time_range
  end
end
