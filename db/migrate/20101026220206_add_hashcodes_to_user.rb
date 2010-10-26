class AddHashcodesToUser < ActiveRecord::Migration
  def self.up
	add_column :hashcodes, :user_id, :int
  end

  def self.down
	remove_column :hashcodes, :user_id
  end
end
