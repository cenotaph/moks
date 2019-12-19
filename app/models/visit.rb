class Visit < ActiveRecord::Base
  #attr_accessible 
  translates :description, :fallbacks_for_empty_translations => true
  belongs_to :residencytype
  belongs_to :project
  belongs_to :artist
  has_and_belongs_to_many :funders
  has_many :events_visits
  has_many :events, :through => :events_visits

  has_many :images, :as => :attachable,  :dependent => :destroy 
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc{|att| att['filename'].blank? && att['id'].blank? }
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['description'].blank? && att['id'].blank?}
  has_many :publicities

  validates_presence_of :start_date, :end_date

  has_many :carousels, :as => :item, :dependent => :destroy
  accepts_nested_attributes_for :carousels, :allow_destroy => true, :reject_if => proc {|att| att['carousel_image'].blank? && att['id'].blank? }

  def dates
    "#{start_date.strftime("%b %d %Y")} - #{end_date.strftime("%b %d %Y")}"
  end

  def display_dates
    if start_date.blank? && end_date.blank?
      []
    elsif end_date.blank?
      [start_date]
    else
      [start_date, end_date]
    end
  end  

  def title
    artist.name 
  end

  def name
    artist.name + " (#{display_dates.map{|x| x.strftime("%B %Y")}.uniq.join(' - ')})"
  end

  def activities
    events.map{|x| x.name }.join(', ')
  end
  
end