class AddCarouselToEvents < ActiveRecord::Migration
  def change
    add_column :events, :carousel_id, :integer
    add_column :visits, :carousel_id, :integer
    add_column :posts, :carousel_id, :integer
    add_column :projects, :carousel_id, :integer
  end
end
