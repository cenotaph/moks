class CreateTranslationTables < ActiveRecord::Migration
  def up
    Image.create_translation_table! :caption => :string
    Funder.create_translation_table! :description => :text
    Residencytype.create_translation_table! :name => :string
    Visit.create_translation_table! :description => :string
    Artist.create_translation_table! :bio => :text
    Projecttype.create_translation_table! :name => :string
    Project.create_translation_table! :name => :string, :description => :text
    Location.create_translation_table! :name => :string
    Event.create_translation_table! :name => :string, :description => :text, :notes => :text
    Postcategory.create_translation_table! :name => :string
    Post.create_translation_table! :title => :string, :body => :text
    Video.create_translation_table! :name => :string, :description => :text
    Sound.create_translation_table! :name => :string, :description => :text
    Page.create_translation_table! :title => :string, :body => :text, :abstract => :text
    Publicity.create_translation_table! :description => :text
    # EventsVisit.create_translation_table! :description => :text
    create_table :postcategories do |f|
    end
    create_table :residencytypes do |f|
    end
  end

  def down
    Image.drop_translation_table!
    Funder.drop_translation_table!
    Residencytype.drop_translation_table!
    Visit.drop_translation_table!
    Artist.drop_translation_table!
    Projecttype.drop_translation_table!
    Project.drop_translation_table!
    Location.drop_translation_table!
    Event.drop_translation_table!
    Postcategory.drop_translation_table!
    Post.drop_translation_table!
    Video.drop_translation_table!
    Sound.drop_translation_table!    
    Page.drop_translation_table!
    Publicity.drop_translation_table!
    EventsVisit.drop_translation_table!
  end
end
