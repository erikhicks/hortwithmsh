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

ActiveRecord::Schema.define(:version => 20120925005610) do

  create_table "classroom_units", :force => true do |t|
    t.integer  "classroom_id"
    t.integer  "unit_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "classrooms", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "subject_id"
    t.text     "description"
    t.text     "introduction"
    t.integer  "sort",         :default => 0
  end

  create_table "materials", :force => true do |t|
    t.string   "filename"
    t.boolean  "enabled"
    t.integer  "sort_order"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "name"
    t.string   "url"
    t.integer  "unit_id"
    t.integer  "sort",       :default => 0
  end

  create_table "subject_classrooms", :force => true do |t|
    t.integer  "classroom_id"
    t.integer  "subject_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "sort_order"
    t.boolean  "enabled"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "sort",       :default => 0
  end

end
