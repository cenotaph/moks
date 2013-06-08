# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130608111349) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["owner_id", "owner_type"], :name => "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], :name => "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], :name => "index_activities_on_trackable_id_and_trackable_type"

  create_table "admin_staffcomments", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "artist_translations", :force => true do |t|
    t.integer  "artist_id"
    t.string   "locale"
    t.text     "bio"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "artist_translations", ["artist_id"], :name => "index_artist_translations_on_artist_id"
  add_index "artist_translations", ["locale"], :name => "index_artist_translations_on_locale"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "website1"
    t.string   "website2"
    t.string   "website3"
    t.string   "avatar"
    t.string   "country"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "budgetareas", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "contacts", :force => true do |t|
    t.string   "contact_person"
    t.string   "organisation"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "country"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "attachment"
    t.boolean  "public"
    t.integer  "documenttype_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "attachable_type"
    t.integer  "attachable_id"
  end

  create_table "documenttypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_translations", :force => true do |t|
    t.integer  "event_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_translations", ["event_id"], :name => "index_event_translations_on_event_id"
  add_index "event_translations", ["locale"], :name => "index_event_translations_on_locale"

  create_table "events", :force => true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "promoter"
    t.float    "cost"
    t.float    "discounted_cost"
    t.string   "discount_reason"
    t.boolean  "register_through_project"
    t.boolean  "registration_required"
    t.integer  "registration_limit"
    t.string   "registration_recipient"
    t.string   "registration_optional_q"
    t.boolean  "hide_registrants"
    t.string   "avatar"
    t.integer  "location_id"
    t.boolean  "donations_requested"
    t.boolean  "published"
    t.string   "slug"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "events_projects", :force => true do |t|
    t.integer "event_id"
    t.integer "project_id"
  end

  add_index "events_projects", ["event_id", "project_id"], :name => "index_events_projects_on_event_id_and_project_id"

  create_table "events_visit_translations", :force => true do |t|
    t.string   "locale"
    t.integer  "events_visit_id"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events_visits", :force => true do |t|
    t.integer "event_id"
    t.integer "visit_id"
  end

  add_index "events_visits", ["event_id", "visit_id"], :name => "index_events_visits_on_event_id_and_visit_id"

  create_table "expenses", :force => true do |t|
    t.date     "date_paid"
    t.string   "recipient"
    t.string   "what_for"
    t.integer  "event_id"
    t.float    "amount"
    t.boolean  "hidden"
    t.integer  "budgetarea_id"
    t.boolean  "has_receipt"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "receipt_number"
    t.date     "date_on_bill"
    t.integer  "project_id"
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "funder_translations", :force => true do |t|
    t.integer  "funder_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "funder_translations", ["funder_id"], :name => "index_funder_translations_on_funder_id"
  add_index "funder_translations", ["locale"], :name => "index_funder_translations_on_locale"

  create_table "funders", :force => true do |t|
    t.string   "name"
    t.boolean  "published"
    t.string   "logo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "funders_visits", :force => true do |t|
    t.integer "funder_id"
    t.integer "visit_id"
  end

  add_index "funders_visits", ["funder_id", "visit_id"], :name => "index_funders_visits_on_funder_id_and_visit_id"

  create_table "image_translations", :force => true do |t|
    t.integer  "image_id"
    t.string   "locale"
    t.string   "caption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "image_translations", ["image_id"], :name => "index_image_translations_on_image_id"
  add_index "image_translations", ["locale"], :name => "index_image_translations_on_locale"

  create_table "images", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "filename"
    t.string   "credit"
    t.boolean  "published"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "incomes", :force => true do |t|
    t.date     "date_received"
    t.string   "recipient"
    t.string   "what_for"
    t.integer  "event_id"
    t.integer  "funder_id"
    t.integer  "project_id"
    t.float    "amount"
    t.boolean  "hidden"
    t.string   "source"
    t.integer  "budgetarea_id"
    t.boolean  "has_receipt"
    t.integer  "invoice_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "invoices", :force => true do |t|
    t.integer  "contact_id"
    t.date     "date_issued"
    t.date     "date_due"
    t.string   "number"
    t.float    "amount"
    t.string   "attachment"
    t.string   "what_for"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "paid",        :default => false, :null => false
  end

  create_table "location_translations", :force => true do |t|
    t.integer  "location_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "location_translations", ["locale"], :name => "index_location_translations_on_locale"
  add_index "location_translations", ["location_id"], :name => "index_location_translations_on_location_id"

  create_table "locations", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.string   "postcode"
    t.string   "map_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.text     "abstract"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_translations", ["locale"], :name => "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_translations", ["locale"], :name => "index_post_translations_on_locale"
  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "postcategories", :force => true do |t|
  end

  create_table "postcategory_translations", :force => true do |t|
    t.integer  "postcategory_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "postcategory_translations", ["locale"], :name => "index_postcategory_translations_on_locale"
  add_index "postcategory_translations", ["postcategory_id"], :name => "index_60d78564fb7833a389c9323b682794366f0db96c"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "is_personal"
    t.boolean  "sticky"
    t.integer  "event_id"
    t.boolean  "published"
    t.string   "slug"
    t.integer  "postcategory_id"
    t.datetime "posted_at"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "old_byline"
  end

  create_table "project_translations", :force => true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_translations", ["locale"], :name => "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], :name => "index_project_translations_on_project_id"

  create_table "projectproposals", :force => true do |t|
    t.string   "name"
    t.string   "organisation"
    t.string   "email"
    t.string   "address"
    t.string   "country_of_origin"
    t.string   "country_of_residence"
    t.string   "phone_number"
    t.text     "short_description"
    t.string   "duration"
    t.text     "long_description"
    t.text     "public_engagement"
    t.text     "materials"
    t.text     "spatial_requirements"
    t.text     "cost"
    t.text     "bio"
    t.text     "urls"
    t.text     "moks_goodfit"
    t.string   "attachment"
    t.boolean  "archived"
    t.integer  "project_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "website1"
    t.string   "website2"
    t.string   "avatar"
    t.boolean  "proposable"
    t.boolean  "published"
    t.string   "slug"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "projecttype_id"
    t.boolean  "active"
  end

  create_table "projecttype_translations", :force => true do |t|
    t.integer  "projecttype_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "projecttype_translations", ["locale"], :name => "index_projecttype_translations_on_locale"
  add_index "projecttype_translations", ["projecttype_id"], :name => "index_projecttype_translations_on_projecttype_id"

  create_table "projecttypes", :force => true do |t|
    t.boolean  "is_major"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publicities", :force => true do |t|
    t.string   "name"
    t.string   "source"
    t.string   "author"
    t.string   "attachment"
    t.string   "url"
    t.integer  "project_id"
    t.integer  "event_id"
    t.integer  "visit_id"
    t.float    "sortorder"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publicity_translations", :force => true do |t|
    t.integer  "publicity_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "publicity_translations", ["locale"], :name => "index_publicity_translations_on_locale"
  add_index "publicity_translations", ["publicity_id"], :name => "index_publicity_translations_on_publicity_id"

  create_table "registrations", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.float    "amount_paid"
    t.text     "comments"
    t.string   "optional_answer"
    t.integer  "event_id"
    t.boolean  "actually_showed_up"
    t.boolean  "waiting_list"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "residencyapplications", :force => true do |t|
    t.string   "name"
    t.string   "organisation"
    t.string   "email"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "country_of_residence"
    t.string   "country_of_origin"
    t.integer  "gender"
    t.string   "contact_phone"
    t.string   "field_of_interest"
    t.text     "urls"
    t.string   "languages_spoken"
    t.string   "cv"
    t.string   "other_attachment"
    t.string   "preferred_dates"
    t.text     "funny_question"
    t.text     "other_questions"
    t.text     "how_did_hear"
    t.string   "reason",               :limit => 2000
    t.integer  "residencytype_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "residencytype_translations", :force => true do |t|
    t.integer  "residencytype_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "residencytype_translations", ["locale"], :name => "index_residencytype_translations_on_locale"
  add_index "residencytype_translations", ["residencytype_id"], :name => "index_63a6769740b84dcce30d1290c9d6a01eb9f2f112"

  create_table "residencytypes", :force => true do |t|
  end

  create_table "resources", :force => true do |t|
    t.integer  "event_id"
    t.integer  "project_id"
    t.string   "attachment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sound_translations", :force => true do |t|
    t.integer  "sound_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sound_translations", ["locale"], :name => "index_sound_translations_on_locale"
  add_index "sound_translations", ["sound_id"], :name => "index_sound_translations_on_sound_id"

  create_table "sounds", :force => true do |t|
    t.string   "soundcloud_id"
    t.string   "filename"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "staffcomments", :force => true do |t|
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "staffcomments", ["user_id"], :name => "index_staffcomments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "username"
    t.string   "real_name"
    t.integer  "artist_id"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "video_translations", :force => true do |t|
    t.integer  "video_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "video_translations", ["locale"], :name => "index_video_translations_on_locale"
  add_index "video_translations", ["video_id"], :name => "index_video_translations_on_video_id"

  create_table "videohosts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.integer  "videohost_id"
    t.integer  "event_id"
    t.string   "provider_id_code"
    t.boolean  "published"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "visit_translations", :force => true do |t|
    t.integer  "visit_id"
    t.string   "locale"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "visit_translations", ["locale"], :name => "index_visit_translations_on_locale"
  add_index "visit_translations", ["visit_id"], :name => "index_visit_translations_on_visit_id"

  create_table "visits", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_rental"
    t.integer  "project_id"
    t.integer  "residencytype_id"
    t.boolean  "published"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "artist_id"
  end

  create_table "wiki_page_versions", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "updated_at"
  end

  add_index "wiki_page_versions", ["page_id"], :name => "index_wiki_page_versions_on_page_id"
  add_index "wiki_page_versions", ["updator_id"], :name => "index_wiki_page_versions_on_updator_id"

  create_table "wiki_pages", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "wiki_pages", ["creator_id"], :name => "index_wiki_pages_on_creator_id"
  add_index "wiki_pages", ["path"], :name => "index_wiki_pages_on_path", :unique => true

  create_table "will_filter_filters", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "will_filter_filters", ["user_id"], :name => "index_will_filter_filters_on_user_id"

end
