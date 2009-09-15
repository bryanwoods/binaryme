class Question < ActiveRecord::Base
  has_many :answers
  
  validates_presence_of :body
  
  state_machine :initial => :pending do
    event :activate do
      transition [:inactive, :pending] => :active
    end
    
    event :pend do
      transition [:inactive, :active] => :pending
    end

    event :deactivate do
      transition [:active, :pending] => :inactive
    end
  end
  
  # Shows the count as a string
  def self.num_of_questions
    "#{self.with_state(:active).count.to_s}"
  end
end
