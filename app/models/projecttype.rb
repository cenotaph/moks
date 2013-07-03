class Projecttype < ActiveRecord::Base
  # attr_accessible :is_major, :translations_attributes
  translates :name, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? }
  has_many :projects
end
