class AddNumberToUserAsString < ActiveRecord::Migration
  def self.up
    add_column :users, :number, :string, :default => "0"
  end

  def self.down
    remove_column :users, :number
  end
end
