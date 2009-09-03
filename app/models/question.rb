class Question < ActiveRecord::Base
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
end
