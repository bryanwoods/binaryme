class AddNumberToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :number, :integer
  end

  def self.down
    remove_column :users, :number
  end
end
