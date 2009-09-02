class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.boolean :response, :default => false, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
