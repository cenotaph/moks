class Page < ActiveRecord::Base
  attr_accessible :slug, :translations_attributes
  translates :title, :body, :abstract, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations,  :reject_if => proc {|att| att['title'].blank? && att['body'].blank? && att['abstract'].blank?} 

  extend FriendlyId
  friendly_id :title_en, :use => :history

  def title_en
    self.title(:en)
  end
  
end
