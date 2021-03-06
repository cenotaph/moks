class Publicity < ActiveRecord::Base
  # attr_accessible 
  translates :description, :fallbacks_for_empty_translations => true
  belongs_to :visit
  belongs_to :event
  belongs_to :project
  mount_uploader :attachment, DocumentUploader
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['description'].blank? }
  validates_presence_of :name, :source
end
