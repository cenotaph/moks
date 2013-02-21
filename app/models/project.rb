class Project < ActiveRecord::Base
  attr_accessible :website1, :website2, :projecttype_id, :translations_attributes, :avatar, :proposable, :published, :slug, :active
  translates :name, :description, :fallbacks_for_empty_translations => true
  belongs_to :projecttype
  has_many :events, :through => :events_projects
  has_many :events_projects
  has_many :projects
  has_many :publicities
  mount_uploader :avatar, ImageUploader
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? && att['description'].blank? }
  extend FriendlyId
  friendly_id :title_en, :use => :history

  scope :active, where(:active => true)

  def title_en
    self.name(:en)
  end
  

end
