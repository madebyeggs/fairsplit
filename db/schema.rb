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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160307183919) do

  create_table "abouts", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.string   "footer",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "email",       limit: 255
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.text     "body"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "namespace",     limit: 255
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"

  create_table "announcements", force: :cascade do |t|
    t.string   "homepage_title",              limit: 255
    t.string   "vimeo",                       limit: 255
    t.text     "description"
    t.string   "soundcloud",                  limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image_file_name",             limit: 255
    t.string   "image_content_type",          limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "large_image_file_name",       limit: 255
    t.string   "large_image_content_type",    limit: 255
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.string   "square_image_file_name",      limit: 255
    t.string   "square_image_content_type",   limit: 255
    t.integer  "square_image_file_size"
    t.datetime "square_image_updated_at"
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.boolean  "latest"
    t.string   "slug",                        limit: 255
    t.string   "facebook_image_file_name",    limit: 255
    t.string   "facebook_image_content_type", limit: 255
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
    t.string   "short_uid_url",               limit: 255
  end

  add_index "announcements", ["slug"], name: "index_announcements_on_slug"

  create_table "artists", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.text     "description"
    t.string   "soundcloud",                  limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "image_file_name",             limit: 255
    t.string   "image_content_type",          limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "square_image_file_name",      limit: 255
    t.string   "square_image_content_type",   limit: 255
    t.integer  "square_image_file_size"
    t.datetime "square_image_updated_at"
    t.boolean  "latest",                                  default: false
    t.string   "large_image_file_name",       limit: 255
    t.string   "large_image_content_type",    limit: 255
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.string   "vimeo",                       limit: 255
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.boolean  "homepage",                                default: false
    t.string   "homepage_title",              limit: 255
    t.string   "slug",                        limit: 255
    t.string   "facebook_image_file_name",    limit: 255
    t.string   "facebook_image_content_type", limit: 255
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
    t.string   "short_uid_url",               limit: 255
    t.string   "fb_url",                      limit: 255
    t.string   "twitter_name",                limit: 255
    t.integer  "position"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url",                limit: 255
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "socials", force: :cascade do |t|
    t.string   "name",                             limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "announcements_image_file_name",    limit: 255
    t.string   "announcements_image_content_type", limit: 255
    t.integer  "announcements_image_file_size"
    t.datetime "announcements_image_updated_at"
    t.string   "works_image_file_name",            limit: 255
    t.string   "works_image_content_type",         limit: 255
    t.integer  "works_image_file_size"
    t.datetime "works_image_updated_at"
    t.string   "artists_image_file_name",          limit: 255
    t.string   "artists_image_content_type",       limit: 255
    t.integer  "artists_image_file_size"
    t.datetime "artists_image_updated_at"
    t.string   "playlists_image_file_name",        limit: 255
    t.string   "playlists_image_content_type",     limit: 255
    t.integer  "playlists_image_file_size"
    t.datetime "playlists_image_updated_at"
    t.string   "abouts_image_file_name",           limit: 255
    t.string   "abouts_image_content_type",        limit: 255
    t.integer  "abouts_image_file_size"
    t.datetime "abouts_image_updated_at"
    t.string   "contacts_image_file_name",         limit: 255
    t.string   "contacts_image_content_type",      limit: 255
    t.integer  "contacts_image_file_size"
    t.datetime "contacts_image_updated_at"
  end

  create_table "sounds", force: :cascade do |t|
    t.string   "title",                          limit: 255
    t.text     "description"
    t.string   "soundcloud",                     limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "image_file_name",                limit: 255
    t.string   "image_content_type",             limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "latest",                                     default: false
    t.string   "homepage_title",                 limit: 255
    t.string   "square_image_file_name",         limit: 255
    t.string   "square_image_content_type",      limit: 255
    t.integer  "square_image_file_size"
    t.datetime "square_image_updated_at"
    t.string   "vimeo",                          limit: 255
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.string   "large_image_file_name",          limit: 255
    t.string   "large_image_content_type",       limit: 255
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.string   "short_url",                      limit: 255
    t.boolean  "homepage",                                   default: false
    t.string   "slug",                           limit: 255
    t.string   "facebook_image_file_name",       limit: 255
    t.string   "facebook_image_content_type",    limit: 255
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
    t.string   "short_uid_url",                  limit: 255
    t.string   "grid_square_image_file_name",    limit: 255
    t.string   "grid_square_image_content_type", limit: 255
    t.integer  "grid_square_image_file_size"
    t.datetime "grid_square_image_updated_at"
  end

  add_index "sounds", ["slug"], name: "index_sounds_on_slug"

  create_table "works", force: :cascade do |t|
    t.string   "title",                          limit: 255
    t.string   "client",                         limit: 255
    t.text     "description"
    t.string   "vimeo",                          limit: 255
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "artist_name",                    limit: 255
    t.string   "type_of_work",                   limit: 255
    t.string   "image_file_name",                limit: 255
    t.string   "image_content_type",             limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "track_name",                     limit: 255
    t.string   "large_image_file_name",          limit: 255
    t.string   "large_image_content_type",       limit: 255
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.boolean  "latest",                                     default: false
    t.integer  "artist_id"
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.boolean  "homepage",                                   default: false
    t.string   "homepage_title",                 limit: 255
    t.string   "slug",                           limit: 255
    t.string   "facebook_image_file_name",       limit: 255
    t.string   "facebook_image_content_type",    limit: 255
    t.integer  "facebook_image_file_size"
    t.datetime "facebook_image_updated_at"
    t.string   "short_uid_url",                  limit: 255
    t.string   "grid_square_image_file_name",    limit: 255
    t.string   "grid_square_image_content_type", limit: 255
    t.integer  "grid_square_image_file_size"
    t.datetime "grid_square_image_updated_at"
  end

  add_index "works", ["slug"], name: "index_works_on_slug"

end
