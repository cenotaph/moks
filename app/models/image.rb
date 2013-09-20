class Image < ActiveRecord::Base
  # attr_accessible :attachable_id, :attachable_type, :filename, :credit, :published, :translations_attributes
  belongs_to :attachable, :polymorphic => true
  translates :caption, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['caption'].blank?  }
  mount_uploader :filename, ImageUploader  
  before_save :update_image_attributes
  
  def update_image_attributes
    if filename.present?
      self.content_type = filename.file.content_type
      self.size = filename.file.size
      self.width, self.height = `identify -format "%wx%h" #{filename.file.path}`.split(/x/)
      # if you also need to store the original filename:
      # self.original_filename = image.file.filename
    end
  end
  
  
end
