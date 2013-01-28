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

ActiveRecord::Schema.define(:version => 20121209125445) do

  create_table "comments", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "likes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "likes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "url"
    t.string   "description"
    t.string   "title"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "community_id"
    t.integer  "likes"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_likes_comments", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_likes_communities", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "user_likes_posts", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "fb_uid",       :null => false
    t.string   "name"
    t.string   "access_token"
    t.string   "mobile_token"
    t.datetime "last_access"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
