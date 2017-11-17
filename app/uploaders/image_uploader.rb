# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :aws

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end

  def default_url
    "/assets/alpha.png"
  end

  version :box do
    process :resize_to_fill => [80, 80]
  end

  version :large do
    process :resize_to_fit => [940, 700]
  end

  version :standard do
    process :resize_to_fit => [600, 400]
  end

  version :thumbnail do
    process :resize_to_fill => [120, 120]
  end

end
