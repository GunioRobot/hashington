class CreateHashcodes < ActiveRecord::Migration
  def self.up
    create_table :hashcodes do |t|
      t.string :hash
      t.string :pin

      t.timestamps
    end
  end

  def self.down
    drop_table :hashcodes
  end
end
