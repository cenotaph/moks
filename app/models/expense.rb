class Expense < ActiveRecord::Base
  # attr_accessible :date_paid, :recipient, :what_for, :event_id, :project_id, :documents_attributes, :amount, :hidden, :paid_by, :budgetarea_id, :has_receipt
  belongs_to :budgetarea
  belongs_to :event
  belongs_to :project
  has_many :documents, :as => :attachable
  accepts_nested_attributes_for :documents, :reject_if => proc {|attr| attr['attachment'].blank? }
  validates_presence_of :date_paid, :amount, :recipient
  
end
