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

ActiveRecord::Schema.define(:version => 20110811152142) do

  create_table "course_orders", :id => false, :force => true do |t|
    t.integer "order_id",                       :null => false
    t.integer "course_id",                      :null => false
    t.integer "number_required",                :null => false
    t.integer "number_cooked",   :default => 0, :null => false
  end

  add_index "course_orders", ["course_id"], :name => "index_course_orders_on_course_id"
  add_index "course_orders", ["order_id"], :name => "index_course_orders_on_order_id"

  create_table "course_types", :force => true do |t|
    t.string "name"
  end

  create_table "courses", :force => true do |t|
    t.string   "name",                                         :null => false
    t.decimal  "price",          :precision => 5, :scale => 2, :null => false
    t.string   "image"
    t.integer  "course_type_id",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["course_type_id"], :name => "index_courses_on_course_type_id"

  create_table "orders", :force => true do |t|
    t.string   "client_name"
    t.boolean  "paid",        :default => false, :null => false
    t.integer  "people"
    t.integer  "table_id",                       :null => false
    t.integer  "user_id",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["table_id"], :name => "index_orders_on_table_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "roles", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "tables", :force => true do |t|
    t.integer "number",  :null => false
    t.integer "seats"
    t.integer "user_id"
  end

  add_index "tables", ["user_id"], :name => "index_tables_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",          :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
