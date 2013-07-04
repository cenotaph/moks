class Funder < ActiveRecord::Base

  translates :description, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations, :reject_if => proc {|att| att['description'].blank? }
  has_and_belongs_to_many :visits
  extend FriendlyId
  friendly_id :name, :use => :history
  mount_uploader :logo, ImageUploader



end
