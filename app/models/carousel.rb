class Carousel < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  mount_uploader :carousel_image, CarouselUploader

  scope :published, ->  { where(active: true)}
  scope :unpublished, -> { where(active: false)}
end
