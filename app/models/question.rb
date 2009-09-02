class Question < ActiveRecord::Base
  validates_presence_of :body
  
  state_machine :initial => :active do
    event :activate do
      transition :inactive => :active
    end

    event :deactivate do
      transition :active => :inactive
    end
  end
end
