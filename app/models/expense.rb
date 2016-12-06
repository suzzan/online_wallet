class Expense < ActiveRecord::Base
     validates :description, :amount, :date, presence: true
end
