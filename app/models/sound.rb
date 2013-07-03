class Sound < ActiveRecord::Base
  #attr_accessible :soundcloud_id, :filename, :event_id, :published, :translations_attributes
  translates :name, :description, :fallbacks_for_empty_translations => true
  belongs_to :event
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['name'].blank? && att['description'].blank?}
  mount_uploader :filename, SoundUploader
end
