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

ActiveRecord::Schema.define(version: 20170405074223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "slug"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.string   "photo"
    t.string   "name"
    t.string   "job"
    t.text     "overview"
    t.string   "email"
    t.string   "phone"
    t.string   "social"
    t.string   "address"
    t.string   "address_line1"
    t.string   "address_line2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "tags"
    t.string   "slug"
    t.string   "visibility"
    t.boolean  "draft"
    t.datetime "published_at"
    t.string   "featured_image"
    t.string   "description"
    t.string   "keywords"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["body"], name: "index_posts_on_body", using: :btree
    t.index ["description"], name: "index_posts_on_description", using: :btree
    t.index ["draft"], name: "index_posts_on_draft", using: :btree
    t.index ["featured_image"], name: "index_posts_on_featured_image", using: :btree
    t.index ["keywords"], name: "index_posts_on_keywords", using: :btree
    t.index ["published_at"], name: "index_posts_on_published_at", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", using: :btree
    t.index ["tags"], name: "index_posts_on_tags", using: :btree
    t.index ["title"], name: "index_posts_on_title", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
    t.index ["visibility"], name: "index_posts_on_visibility", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "timeline"
    t.text     "info"
    t.string   "featured_image"
    t.integer  "portfolio_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "position"
    t.string   "url"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "name"
    t.json     "config"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "mastery"
    t.text     "info"
    t.integer  "portfolio_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "position"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "title",                  default: "", null: false
    t.string   "phone",                  default: "", null: false
    t.string   "telegram",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

end
