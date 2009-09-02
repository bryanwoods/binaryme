class AddAdditionalInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :curator, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :curator
  end
end
