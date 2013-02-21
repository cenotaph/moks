class Postcategory < ActiveRecord::Base
  translates :name, :fallbacks_for_empty_translations => true
  has_many :posts
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }

end