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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161022114605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type", limit: 510
    t.integer  "owner_id"
    t.string   "owner_type",     limit: 510
    t.string   "key",            limit: 510
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type", limit: 510
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "admin_staffcomments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_translations", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "locale",     limit: 510
    t.text     "bio"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name",                limit: 510
    t.string   "website1",            limit: 510
    t.string   "website2",            limit: 510
    t.string   "website3",            limit: 510
    t.string   "avatar",              limit: 510
    t.string   "country",             limit: 510
    t.string   "slug",                limit: 510
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email",               limit: 510
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_size"
    t.integer  "avatar_height"
    t.integer  "avatar_width"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider",   limit: 510
    t.string   "uid",        limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "budgetareas", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.boolean  "active"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "carousels", force: :cascade do |t|
    t.boolean  "active",                     default: false, null: false
    t.string   "alternate_url",  limit: 255
    t.string   "item_type",      limit: 255
    t.integer  "item_id"
    t.decimal  "sort_order",                 default: "0.0", null: false
    t.string   "carousel_image", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 510, null: false
    t.string   "data_content_type", limit: 510
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 60
    t.string   "type",              limit: 60
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "contact_person", limit: 510
    t.string   "organisation",   limit: 510
    t.string   "address1",       limit: 510
    t.string   "address2",       limit: 510
    t.string   "city",           limit: 510
    t.string   "county",         limit: 510
    t.string   "postcode",       limit: 510
    t.string   "country",        limit: 510
    t.string   "phone",          limit: 510
    t.string   "website",        limit: 510
    t.string   "email",          limit: 510
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "name",            limit: 510
    t.integer  "user_id"
    t.text     "description"
    t.string   "attachment",      limit: 510
    t.boolean  "public"
    t.integer  "documenttype_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "attachable_type", limit: 510
    t.integer  "attachable_id"
  end

  create_table "documenttypes", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "event_translations", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "locale",      limit: 510
    t.string   "name",        limit: 510
    t.text     "description"
    t.text     "notes"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "promoter",                 limit: 510
    t.float    "cost"
    t.float    "discounted_cost"
    t.string   "discount_reason",          limit: 510
    t.boolean  "register_through_project"
    t.boolean  "registration_required"
    t.integer  "registration_limit"
    t.string   "registration_recipient",   limit: 510
    t.string   "registration_optional_q",  limit: 510
    t.boolean  "hide_registrants"
    t.string   "avatar",                   limit: 510
    t.integer  "location_id"
    t.boolean  "donations_requested"
    t.boolean  "published"
    t.string   "slug",                     limit: 510
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "carousel_id"
  end

  create_table "events_projects", force: :cascade do |t|
    t.integer "event_id"
    t.integer "project_id"
  end

  create_table "events_visit_translations", force: :cascade do |t|
    t.string   "locale",          limit: 510
    t.integer  "events_visit_id"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "events_visits", force: :cascade do |t|
    t.integer "event_id"
    t.integer "visit_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.date     "date_paid"
    t.string   "recipient",      limit: 510
    t.string   "what_for",       limit: 510
    t.integer  "event_id"
    t.float    "amount"
    t.boolean  "hidden"
    t.integer  "budgetarea_id"
    t.boolean  "has_receipt"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "receipt_number", limit: 510
    t.date     "date_on_bill"
    t.integer  "project_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 510, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 80
    t.datetime "created_at"
    t.index ["slug", "sluggable_type"], name: "friendly_id_slugs_slug_sluggable_type_key", unique: true, using: :btree
  end

  create_table "funder_translations", force: :cascade do |t|
    t.integer  "funder_id"
    t.string   "locale",      limit: 510
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "funders", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.boolean  "published"
    t.string   "logo",       limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug",       limit: 510
  end

  create_table "funders_visits", force: :cascade do |t|
    t.integer "funder_id"
    t.integer "visit_id"
  end

  create_table "image_translations", force: :cascade do |t|
    t.integer  "image_id"
    t.string   "locale",     limit: 510
    t.string   "caption",    limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type", limit: 510
    t.string   "filename",        limit: 510
    t.string   "credit",          limit: 510
    t.boolean  "published"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "content_type",    limit: 255
    t.bigint   "size"
    t.integer  "height"
    t.integer  "width"
  end

  create_table "incomes", force: :cascade do |t|
    t.date     "date_received"
    t.string   "recipient",     limit: 510
    t.string   "what_for",      limit: 510
    t.integer  "event_id"
    t.integer  "funder_id"
    t.integer  "project_id"
    t.float    "amount"
    t.boolean  "hidden"
    t.string   "source",        limit: 510
    t.integer  "budgetarea_id"
    t.boolean  "has_receipt"
    t.integer  "invoice_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "contact_id"
    t.date     "date_issued"
    t.date     "date_due"
    t.string   "number",      limit: 510
    t.float    "amount"
    t.string   "attachment",  limit: 510
    t.string   "what_for",    limit: 510
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "paid",                    default: false, null: false
  end

  create_table "location_translations", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "locale",      limit: 510
    t.string   "name",        limit: 510
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address1",   limit: 510
    t.string   "address2",   limit: 510
    t.string   "city",       limit: 510
    t.string   "county",     limit: 510
    t.string   "country",    limit: 510
    t.string   "postcode",   limit: 510
    t.string   "map_url",    limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "locale",     limit: 510
    t.string   "title",      limit: 510
    t.text     "body"
    t.text     "abstract"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "slug",       limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "post_translations", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "locale",     limit: 510
    t.string   "title",      limit: 510
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "postcategories", force: :cascade do |t|
  end

  create_table "postcategory_translations", force: :cascade do |t|
    t.integer  "postcategory_id"
    t.string   "locale",          limit: 510
    t.string   "name",            limit: 510
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "is_personal"
    t.boolean  "sticky"
    t.integer  "event_id"
    t.boolean  "published"
    t.string   "slug",            limit: 510
    t.integer  "postcategory_id"
    t.datetime "posted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "old_byline",      limit: 510
    t.integer  "carousel_id"
  end

  create_table "project_translations", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "locale",      limit: 510
    t.string   "name",        limit: 510
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "projectproposals", force: :cascade do |t|
    t.string   "name",                 limit: 510
    t.string   "organisation",         limit: 510
    t.string   "email",                limit: 510
    t.string   "address",              limit: 510
    t.string   "country_of_origin",    limit: 510
    t.string   "country_of_residence", limit: 510
    t.string   "phone_number",         limit: 510
    t.text     "short_description"
    t.string   "duration",             limit: 510
    t.text     "long_description"
    t.text     "public_engagement"
    t.text     "materials"
    t.text     "spatial_requirements"
    t.text     "cost"
    t.text     "bio"
    t.text     "urls"
    t.text     "moks_goodfit"
    t.string   "attachment",           limit: 510
    t.boolean  "archived"
    t.integer  "project_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "website1",       limit: 510
    t.string   "website2",       limit: 510
    t.string   "avatar",         limit: 510
    t.boolean  "proposable"
    t.boolean  "published"
    t.string   "slug",           limit: 510
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "projecttype_id"
    t.boolean  "active"
    t.integer  "carousel_id"
  end

  create_table "projecttype_translations", force: :cascade do |t|
    t.integer  "projecttype_id"
    t.string   "locale",         limit: 510
    t.string   "name",           limit: 510
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "projecttypes", force: :cascade do |t|
    t.boolean  "is_major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicities", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.string   "source",     limit: 510
    t.string   "author",     limit: 510
    t.string   "attachment", limit: 510
    t.string   "url",        limit: 510
    t.integer  "project_id"
    t.integer  "event_id"
    t.integer  "visit_id"
    t.float    "sortorder"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publicity_translations", force: :cascade do |t|
    t.integer  "publicity_id"
    t.string   "locale",       limit: 510
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name",               limit: 510
    t.string   "email",              limit: 510
    t.string   "phone",              limit: 510
    t.float    "amount_paid"
    t.text     "comments"
    t.string   "optional_answer",    limit: 510
    t.integer  "event_id"
    t.boolean  "actually_showed_up"
    t.boolean  "waiting_list"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "residencyapplications", force: :cascade do |t|
    t.string   "name",                 limit: 510
    t.string   "organisation",         limit: 510
    t.string   "email",                limit: 510
    t.string   "address1",             limit: 510
    t.string   "address2",             limit: 510
    t.string   "city",                 limit: 510
    t.string   "county",               limit: 510
    t.string   "postcode",             limit: 510
    t.string   "country_of_residence", limit: 510
    t.string   "country_of_origin",    limit: 510
    t.integer  "gender"
    t.string   "contact_phone",        limit: 510
    t.string   "field_of_interest",    limit: 510
    t.text     "urls"
    t.string   "languages_spoken",     limit: 510
    t.string   "cv",                   limit: 510
    t.string   "other_attachment",     limit: 510
    t.string   "preferred_dates",      limit: 510
    t.text     "funny_question"
    t.text     "other_questions"
    t.text     "how_did_hear"
    t.string   "reason",               limit: 4000
    t.integer  "residencytype_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "residencytype_translations", force: :cascade do |t|
    t.integer  "residencytype_id"
    t.string   "locale",           limit: 510
    t.string   "name",             limit: 510
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "residencytypes", force: :cascade do |t|
    t.boolean "active", default: true, null: false
  end

  create_table "resources", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "project_id"
    t.string   "attachment", limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 510
    t.integer  "resource_id"
    t.string   "resource_type", limit: 510
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sound_translations", force: :cascade do |t|
    t.integer  "sound_id"
    t.string   "locale",      limit: 510
    t.string   "name",        limit: 510
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string   "soundcloud_id", limit: 510
    t.string   "filename",      limit: 510
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "staffcomments", force: :cascade do |t|
    t.string   "commentable_type", limit: 510
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 510, default: "", null: false
    t.string   "encrypted_password",     limit: 510, default: "", null: false
    t.string   "reset_password_token",   limit: 510
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 510
    t.string   "last_sign_in_ip",        limit: 510
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 510
    t.string   "username",               limit: 510
    t.string   "real_name",              limit: 510
    t.integer  "artist_id"
    t.string   "avatar",                 limit: 510
    t.index ["email"], name: "users_email_key", unique: true, using: :btree
    t.index ["reset_password_token"], name: "users_reset_password_token_key", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "video_translations", force: :cascade do |t|
    t.integer  "video_id"
    t.string   "locale",      limit: 510
    t.string   "name",        limit: 510
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "videohosts", force: :cascade do |t|
    t.string   "name",       limit: 510
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "videohost_id"
    t.integer  "event_id"
    t.string   "provider_id_code", limit: 510
    t.boolean  "published"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "visit_translations", force: :cascade do |t|
    t.integer  "visit_id"
    t.string   "locale",      limit: 510
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "visits", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_rental"
    t.integer  "project_id"
    t.integer  "residencytype_id"
    t.boolean  "published"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "artist_id"
    t.integer  "carousel_id"
  end

  create_table "wiki_page_versions", force: :cascade do |t|
    t.integer  "page_id",                null: false
    t.integer  "updator_id"
    t.integer  "number"
    t.string   "comment",    limit: 510
    t.string   "path",       limit: 510
    t.string   "title",      limit: 510
    t.text     "content"
    t.datetime "updated_at"
  end

  create_table "wiki_pages", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "updator_id"
    t.string   "path",       limit: 510
    t.string   "title",      limit: 510
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["path"], name: "wiki_pages_path_key", unique: true, using: :btree
  end

  create_table "will_filter_filters", force: :cascade do |t|
    t.string   "type",             limit: 510
    t.string   "name",             limit: 510
    t.text     "data"
    t.integer  "user_id"
    t.string   "model_class_name", limit: 510
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
