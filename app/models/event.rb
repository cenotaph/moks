class Event < ActiveRecord::Base
  attr_accessible :start_at, :end_at, :images_attributes, :sounds_attributes, :videos_attributes, :promoter, :cost, :translations_attributes, :discounted_cost, :discount_reason, :register_through_project, :registration_required, :registration_limit, :registration_recipient, :registration_optional_q, :hide_registrants, :avatar, :location_id, :donations_requested, :published, :slug, :project_ids
  translates :name, :description, :notes, :fallbacks_for_empty_translations => true
  belongs_to :location
  has_many :projects, :through => :events_projects
  has_many :events_projects
  has_many :events_visits
  has_many :visits, :through => :events_visits
  has_many :artists, :through => :visits
  has_many :images, :as => :attachable, :dependent => :destroy
  has_many :videos
  has_many :sounds
  has_many :posts
  has_many :resources
  has_many :publicities
  has_many :registrations
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? && att['description'].blank? && att['notes'].blank? }
  accepts_nested_attributes_for :images, :allow_destroy => true  
  accepts_nested_attributes_for :sounds, :allow_destroy => true, :reject_if => proc {|attr| attr['soundcloud_id'].blank? && attr['filename'].blank? }
  accepts_nested_attributes_for :videos, :allow_destroy => true, :reject_if => proc {|attr| attr['provider_id_code'].blank? } 

  extend FriendlyId
  friendly_id :title_en, :use => :history

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
  
end
