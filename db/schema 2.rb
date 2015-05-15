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

ActiveRecord::Schema.define(version: 20141003094735) do

  create_table "category_taxons", force: true do |t|
    t.integer "child_id",  limit: 4
    t.integer "parent_id", limit: 4
    t.integer "position",  limit: 4, default: 0
  end

  create_table "contributions", force: true do |t|
    t.integer "user_id",         limit: 4
    t.integer "contribute_id",   limit: 4
    t.string  "contribute_type", limit: 255
  end



  create_table "lists", force: true do |t|
    t.string  "name",        limit: 255, default: ""
    t.integer "items_count", limit: 4,   default: 0
    t.integer "position",    limit: 4,   default: 0
    t.integer "status",      limit: 4,   default: 0
  end

  create_table "measure_values", force: true do |t|
    t.integer "measure_id", limit: 4
    t.string  "value",      limit: 255
  end

  create_table "options", force: true do |t|
    t.string   "content",     limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id", limit: 4
  end

  create_table "part_solos", force: true do |t|
    t.integer "part_id", limit: 4
    t.integer "solo_id", limit: 4
  end

  create_table "questions", force: true do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "title",       limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.text     "the_role",    limit: 65535, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sample_signs", force: true do |t|
    t.integer "sample_id",        limit: 4
    t.integer "sign_id",          limit: 4
    t.integer "measure_value_id", limit: 4
    t.string  "value",            limit: 255
    t.string  "sign_name",        limit: 255
    t.string  "sign_type",        limit: 255
  end

  create_table "samples", force: true do |t|
    t.string   "title",      limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string  "name",        limit: 255
    t.integer "sort_id",     limit: 4
    t.integer "position",    limit: 4,   default: 0
    t.integer "add_sort_id", limit: 4
  end

  create_table "sign_items", force: true do |t|
    t.integer "sign_id", limit: 4
    t.integer "item_id", limit: 4
  end

  create_table "sign_options", force: true do |t|
    t.integer "option_id", limit: 4
    t.integer "sign_id",   limit: 4
    t.integer "user_id",   limit: 4
    t.string  "reason",    limit: 255
  end

  create_table "signs", force: true do |t|
    t.string  "name",    limit: 255
    t.text    "content", limit: 65535
    t.integer "wiki_id", limit: 4
    t.string  "type",    limit: 255
  end

  create_table "solo_parts", force: true do |t|
    t.integer "solo_id",  limit: 4
    t.integer "part_id",  limit: 4
    t.integer "position", limit: 4, default: 0
  end

  create_table "solo_taxons", force: true do |t|
    t.integer "child_id",  limit: 4
    t.integer "parent_id", limit: 4
    t.integer "position",  limit: 4, default: 0
  end















end
