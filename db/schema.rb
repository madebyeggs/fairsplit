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

ActiveRecord::Schema.define(:version => 20150515062309) do

  create_table "abouts", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "footer"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "announcements", :force => true do |t|
    t.string   "homepage_title"
    t.string   "vimeo"
    t.text     "description"
    t.string   "soundcloud"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "large_image_file_name"
    t.string   "large_image_content_type"
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.boolean  "latest"
    t.string   "square_image_file_name"
    t.string   "square_image_content_type"
    t.integer  "square_image_file_size"
    t.datetime "square_image_updated_at"
    t.string   "uid"
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.string   "short_uid_url"
  end

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "soundcloud"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "square_image_file_name"
    t.string   "square_image_content_type"
    t.integer  "square_image_file_size"
    t.datetime "square_image_updated_at"
    t.boolean  "latest"
    t.string   "large_image_file_name"
    t.string   "large_image_content_type"
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.string   "homepage_title"
    t.string   "vimeo"
    t.string   "uid"
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.string   "short_uid_url"
    t.string   "short_id_url"
  end

  create_table "homes", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

# Could not dump table "sounds" because of following StandardError
#   Unknown type 'uuid' for column 'uuid'

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "works", :force => true do |t|
    t.string   "title"
    t.string   "client"
    t.text     "description"
    t.string   "vimeo"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "artist_name"
    t.string   "type_of_work"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "track_name"
    t.string   "large_image_file_name"
    t.string   "large_image_content_type"
    t.integer  "large_image_file_size"
    t.datetime "large_image_updated_at"
    t.boolean  "latest"
    t.integer  "artist_id"
    t.string   "homepage_title"
    t.string   "uid"
    t.boolean  "is_artist"
    t.boolean  "is_work"
    t.boolean  "is_sound"
    t.boolean  "is_announcement"
    t.string   "short_id_url"
    t.string   "short_uid_url"
  end

end
