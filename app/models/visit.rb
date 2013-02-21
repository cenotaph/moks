class Visit < ActiveRecord::Base
  attr_accessible :start_date, :artist_id, :translations_attributes, :event_ids, :end_date, :is_rental, :project_id, :residencytype_id, :published, :funder_ids
  translates :description, :fallbacks_for_empty_translations => true
  belongs_to :residencytype
  belongs_to :project
  belongs_to :artist
  has_and_belongs_to_many :funders
  has_many :events, :through => :events_visits
  has_many :events_visits
  has_many :images, :as => :attachable,  :dependent => :destroy 
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['description'].blank?}
  has_many :publicities

  validates_presence_of :start_date, :end_date

  def dates
    "#{start_date.strftime("%b %d %Y")} - #{end_date.strftime("%b %d %Y")}"
  end


  def activities
    events.map{|x| x.name }.join(', ')
  end
  
end