class Income < ActiveRecord::Base
  # attr_accessible :attachable_type, :attachable_id,  :date_received, :documents_attributes, :invoice_id, :recipient, :what_for, :event_id, :funder_id, :project_id, :amount, :hidden, :source, :budgetarea_id, :has_receipt
  belongs_to :budgetarea 
  belongs_to :funder
  belongs_to :project
  belongs_to :event
  belongs_to :invoice
  has_many :documents, :as => :attachable
  accepts_nested_attributes_for :documents, :reject_if => proc {|attr| attr['attachment'].blank? }
  validates_presence_of :date_received, :amount, :source
end
