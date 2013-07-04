class Location < ActiveRecord::Base
  translates :name, :fallbacks_for_empty_translations => true
  has_many :events
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }
  validates_presence_of :name, :address1, :country
  
end
