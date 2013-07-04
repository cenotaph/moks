class Income < ActiveRecord::Base

  belongs_to :budgetarea 
  belongs_to :funder
  belongs_to :project
  belongs_to :event
  belongs_to :invoice
  has_many :documents, :as => :attachable
  accepts_nested_attributes_for :documents, :reject_if => proc {|attr| attr['attachment'].blank? }
  validates_presence_of :date_received, :amount, :source
end
