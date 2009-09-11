class RemoveUserFromQuestions < ActiveRecord::Migration
  def self.up
    remove_column :questions, :user_id
  end

  def self.down
    add_column :questions, :user_id, :integer
  end
end
