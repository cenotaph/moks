class Registration < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :amount_paid, :comments, :optional_answer, :event_id, :actually_showed_up, :waiting_list
  belongs_to :event
end
