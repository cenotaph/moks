class Residencytype < ActiveRecord::Base
  translates :name, :fallbacks_for_empty_translations => true
  has_many :visits
  
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }

  scope :active, -> { where(active:true ) }
end