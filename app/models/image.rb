class Image < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :filename, :credit, :published, :translations_attributes
  belongs_to :attachable, :polymorphic => true
  translates :caption, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['caption'].blank? }
  mount_uploader :filename, ImageUploader  
end
