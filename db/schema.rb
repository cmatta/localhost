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

ActiveRecord::Schema.define(:version => 20111116225940) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.string   "title"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                    :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "zipcode",                      :limit => 255
    t.string   "address_field1"
    t.string   "address_field2"
    t.string   "city"
    t.string   "state"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_pic_filename"
    t.string   "profile_pic_contenttype"
    t.integer  "profile_pic_size"
    t.datetime "profile_pic_updated_at"
    t.string   "profilepic_file_name"
    t.string   "profilepic_content_type"
    t.integer  "profilepic_file_size"
    t.datetime "profilepic_updated_at"
    t.string   "roles"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
