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

ActiveRecord::Schema.define(:version => 20130409212042) do

  create_table "ancestor_references", :force => true do |t|
    t.integer  "ancestor_id"
    t.integer  "descendant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ancestor_references", ["ancestor_id"], :name => "index_ancestor_references_on_ancestor_id"
  add_index "ancestor_references", ["descendant_id"], :name => "index_ancestor_references_on_descendant_id"

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "body"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["parent_id"], :name => "index_comments_on_comment_id"
  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "commentvotes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "commentvotes", ["comment_id"], :name => "index_commentvotes_on_comment_id"
  add_index "commentvotes", ["user_id"], :name => "index_commentvotes_on_user_id"

  create_table "emails", :force => true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "postvotes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "postvotes", ["post_id"], :name => "index_postvotes_on_post_id"
  add_index "postvotes", ["user_id"], :name => "index_postvotes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "karma"
    t.string   "remember_token"
  end

end
