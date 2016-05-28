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

ActiveRecord::Schema.define(version: 20160528145157) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "group_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "group_catgories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "content",            limit: 65535
    t.integer  "status",             limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id",            limit: 4
    t.integer  "category_id",        limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "views",              limit: 4
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "status",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "group_category_id", limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.text     "detail",                     limit: 65535
    t.float    "price",                      limit: 24
    t.integer  "quantum",                    limit: 4
    t.text     "note",                       limit: 65535
    t.integer  "view",                       limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "product_image_file_name",    limit: 255
    t.string   "product_image_content_type", limit: 255
    t.integer  "product_image_file_size",    limit: 4
    t.datetime "product_image_updated_at"
    t.integer  "product_category_id",        limit: 4
    t.integer  "group_category_id",          limit: 4
  end

  create_table "qsadmin_posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",     limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",    limit: 4
    t.integer  "product_id", limit: 4
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",     limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "taggings", ["post_id"], name: "index_taggings_on_post_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "content",            limit: 65535
    t.string   "website",            limit: 255
    t.string   "regency",            limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255
    t.string   "username",               limit: 255
    t.string   "password",               limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "salt",                   limit: 255
    t.string   "password_digest",        limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "password_reset_token",   limit: 255
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "taggings", "posts"
  add_foreign_key "taggings", "tags"
end
