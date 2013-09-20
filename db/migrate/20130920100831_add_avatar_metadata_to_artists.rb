class AddAvatarMetadataToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :avatar_content_type, :string
    add_column :artists, :avatar_size, :integer, :length => 8
    add_column :artists, :avatar_height, :integer
    add_column :artists, :avatar_width, :integer
  end
end
