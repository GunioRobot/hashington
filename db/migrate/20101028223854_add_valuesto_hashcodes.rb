class AddValuestoHashcodes < ActiveRecord::Migration
  def self.up
	add_column :hashcodes, :initial_value, :float
	add_column :hashcodes, :current_value, :float
  end

  def self.down
	remove_column :hashcodes, :initial_value, :float
	remove_column :hashcodes, :current_value, :float
  end
end
