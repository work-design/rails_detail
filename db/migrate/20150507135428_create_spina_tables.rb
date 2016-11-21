class CreateSpinaTables < ActiveRecord::Migration
  def change

    create_table "attachment_collections", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "attachment_collections_attachments", force: :cascade do |t|
      t.integer "attachment_collection_id"
      t.integer "attachment_id"
    end

    create_table "attachments", force: :cascade do |t|
      t.string   "file"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "colors", force: :cascade do |t|
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "inquiries", force: :cascade do |t|
      t.string   "name"
      t.string   "email"
      t.string   "phone"
      t.text     "message"
      t.boolean  "archived",   default: false
      t.datetime "created_at",                 null: false
      t.datetime "updated_at",                 null: false
      t.boolean  "spam"
    end

    create_table "layout_parts", force: :cascade do |t|
      t.string   "title"
      t.string   "name"
      t.integer  "layout_partable_id"
      t.string   "layout_partable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "site_id"
    end

    create_table "lines", force: :cascade do |t|
      t.string   "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "navigations", force: :cascade do |t|
      t.integer  "site_id"
      t.integer  "page_id"
      t.string   "title"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.integer  "parent_id"
      t.integer  "position",   default: 0
    end

    create_table "page_parts", force: :cascade do |t|
      t.string   "title"
      t.string   "name"
      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
      t.integer  "page_id"
      t.integer  "page_partable_id"
      t.string   "page_partable_type"
    end

    create_table "pages", force: :cascade do |t|
      t.integer  "site_id"
      t.integer  "user_id"
      t.string   "slug"
      t.string   "title"
      t.text     "body"
      t.datetime "created_at",                          null: false
      t.datetime "updated_at",                          null: false
      t.string   "menu_title"
      t.string   "description"
      t.boolean  "show_in_menu",        default: true
      t.boolean  "deletable",           default: true
      t.string   "name"
      t.string   "seo_title"
      t.boolean  "skip_to_first_child", default: false
      t.string   "view_template"
      t.string   "layout_template"
      t.boolean  "draft",               default: false
      t.string   "link_url"
      t.string   "ancestry"
      t.integer  "position"
      t.string   "materialized_path"
      t.boolean  "active",              default: true
    end

    create_table "photo_collections", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "photo_collections_photos", force: :cascade do |t|
      t.integer "photo_collection_id"
      t.integer "photo_id"
      t.integer "position"
    end

    create_table "photos", force: :cascade do |t|
      t.string   "file"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "file_id"
    end

    create_table "sites", force: :cascade do |t|
      t.integer  "user_id"
      t.string   "slug"
      t.string   "name"
      t.string   "theme"
      t.datetime "created_at",                    null: false
      t.datetime "updated_at",                    null: false
      t.boolean  "current"
      t.string   "address"
      t.string   "postal_code"
      t.string   "city"
      t.string   "phone"
      t.string   "email"
      t.text     "preferences"
      t.string   "logo"
      t.string   "kvk_identifier"
      t.string   "vat_identifier"
      t.boolean  "robots_allowed", default: true
    end

    create_table "structure_items", force: :cascade do |t|
      t.integer  "structure_id"
      t.integer  "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "structure_items", ["structure_id"], name: "index_structure_items_on_structure_id", using: :btree

    create_table "structure_parts", force: :cascade do |t|
      t.integer  "structure_item_id"
      t.integer  "structure_partable_id"
      t.string   "structure_partable_type"
      t.string   "name"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "structure_parts", ["structure_item_id"], name: "index_structure_parts_on_structure_item_id", using: :btree
    add_index "structure_parts", ["structure_partable_id"], name: "index_structure_parts_on_structure_partable_id", using: :btree

    create_table "structures", force: :cascade do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "texts", force: :cascade do |t|
      t.text     "content"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "widgets", force: :cascade do |t|
      t.string   "name"
      t.string   "title"
      t.string   "description"
      t.integer  "site_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
    end

  end
end
