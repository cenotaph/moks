class Location < ActiveRecord::Base
  # attr_accessible :address1, :address2, :city, :county, :country, :postcode, :map_url, :translations_attributes
  translates :name, :fallbacks_for_empty_translations => true
  has_many :events
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }
  validates_presence_of :name, :address1, :country
  
end
