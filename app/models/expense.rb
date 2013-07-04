class Expense < ActiveRecord::Base

  belongs_to :budgetarea
  belongs_to :event
  belongs_to :project
  has_many :documents, :as => :attachable
  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => proc {|attr| attr['attachment'].blank? }
  validates_presence_of :date_paid, :amount, :recipient
  
end
