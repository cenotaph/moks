class Residencyapplication < ActiveRecord::Base
  belongs_to :residencytype
  # attr_accessible 
  mount_uploader :cv, DocumentUploader
  mount_uploader :other_attachment, DocumentUploader
  has_many :staffcomments, :as => :commentable, :dependent => :destroy
  validates_presence_of :name, :email, :country_of_residence, :field_of_interest, :preferred_dates, :other_questions
end
