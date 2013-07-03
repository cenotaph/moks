class Budgetarea < ActiveRecord::Base
  # attr_accessible :name, :active
  has_many :incomes
  has_many :expenses
end
