class Event < ActiveRecord::Base
  paginates_per 6
  # attr_accessible 
  translates :name, :description, :notes, :fallbacks_for_empty_translations => true
  belongs_to :location
  has_many :events_projects
  has_many :events_visits
  has_many :projects, :through => :events_projects
  has_many :visits, :through => :events_visits
  has_many :artists, :through => :visits
  has_many :images, :as => :attachable, :dependent => :destroy
  has_many :carousels, :as => :item, :dependent => :destroy
  has_many :videos
  has_many :sounds
  has_many :posts
  has_many :resources
  has_many :publicities
  has_many :registrations
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? && att['description'].blank? && att['notes'].blank? }
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc {|attr| attr['filename'].blank? && attr['id'].blank? }
  accepts_nested_attributes_for :sounds, :allow_destroy => true, :reject_if => proc {|attr| attr['soundcloud_id'].blank? && attr['filename'].blank? }
  accepts_nested_attributes_for :videos, :allow_destroy => true, :reject_if => proc {|attr| attr['provider_id_code'].blank? } 
  accepts_nested_attributes_for :carousels, :allow_destroy => true, :reject_if => proc {|att| att['carousel_image'].blank? && att['id'].blank? }

  validates_presence_of :start_at
 
  extend FriendlyId
  friendly_id :title_en, :use => :history

  scope :published, -> { where(published: true) }
  
  def title
    name
  end
  
  def title_en
    self.name(:en)
  end

  def dates
    if start_at.blank? && end_at.blank?
      'no dates'
    elsif end_at.blank?
      start_at.strftime("%b %d %Y")
    else
      "#{start_at.strftime('%b %d %Y')} - #{end_at.strftime('%b %d %Y')}"
    end
  end

  def display_dates
    if start_at.blank? && end_at.blank?
      []
    elsif end_at.blank?
      [start_at]
    else
      [start_at, end_at]
    end
  end  
end
