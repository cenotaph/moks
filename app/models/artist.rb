class Artist < ActiveRecord::Base

  translates :bio, :fallbacks_for_empty_translations => true
  has_many :visits
  has_one :user
  has_many :images, :through => :visits
  has_many :events, :through => :visits
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['bio'].blank? }
  accepts_nested_attributes_for :visits, :allow_destroy => true, :reject_if => proc {|att| att['start_date'].blank?}
  accepts_nested_attributes_for :images
  mount_uploader :avatar, ImageUploader
  extend FriendlyId
  friendly_id :name, :use => :history
  
  validates_presence_of :name, :email
  
  before_save :update_avatar_attributes
  
  def update_avatar_attributes
    if avatar.present?
      self.avatar_content_type = avatar.file.content_type
      self.avatar_size = avatar.file.size
      self.avatar_width, self.avatar_height = `identify -format "%wx%h" #{avatar.file.path}`.split(/x/)
      # if you also need to store the original filename:
      # self.original_filename = image.file.filename
    end
  end
end
