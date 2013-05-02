class Post < ActiveRecord::Base
  attr_accessible :user_id, :is_personal, :sticky, :event_id, :published, :slug, :postcategory_id, :translations_attributes, :images_attributes
  belongs_to :user
  translates :title, :body, :fallbacks_for_empty_translations => true
  belongs_to :event
  # has_many :images, :through => :event
  has_many :images, :as => :attachable, :dependent => :destroy    
  accepts_nested_attributes_for :images, :allow_destroy => true
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['title'].blank?  && att['body'].blank? }
  belongs_to :postcategory
  extend FriendlyId
  friendly_id :title_en, :use => :history
  before_save :check_for_post_date 
  validates_presence_of :postcategory_id

  scope :published, where(:published => true)
  scope :news, where(:postcategory_id => 2).order('posted_at desc')
  scope :blog, where(:postcategory_id => 1).order('posted_at desc')
  
  def check_for_post_date
    if posted_at.blank? && published == true
      self.posted_at = Time.now
    end
  end

  def title_en
    self.title(:en)
  end
  
  def posted_by
    user.nil? ? old_byline : user.name
  end
  
end
