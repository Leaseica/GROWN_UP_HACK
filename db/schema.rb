# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_05_162459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "sub_category_id", null: false
    t.text "paragraph1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "raw_html_content"
    t.text "button"
    t.string "additional_resources_1"
    t.string "additional_resources_2"
    t.string "additional_resources_1_listing"
    t.string "additional_resources_2_listing"
    t.index ["sub_category_id"], name: "index_articles_on_sub_category_id"
  end

  create_table "articles_platforms", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "platform_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_articles_platforms_on_article_id"
    t.index ["platform_id"], name: "index_articles_platforms_on_platform_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_guides", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_structure"
    t.boolean "is_micro_entrepreneur"
    t.boolean "is_business_extension"
    t.boolean "has_previous_self_employment"
    t.string "representative_role"
    t.string "representative_type"
    t.string "title"
    t.index ["article_id"], name: "index_my_guides_on_article_id"
    t.index ["user_id"], name: "index_my_guides_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "logo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "platform_type"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "url"
    t.string "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.bigint "my_guide_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["my_guide_id"], name: "index_reminders_on_my_guide_id"
    t.index ["user_id"], name: "index_reminders_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "occupation"
    t.string "address"
    t.date "birthday"
    t.string "country"
    t.string "phone_number"
    t.string "gender"
    t.string "city"
    t.string "zip_code"
    t.string "title"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "sub_categories"
  add_foreign_key "articles_platforms", "articles"
  add_foreign_key "articles_platforms", "platforms"
  add_foreign_key "my_guides", "articles"
  add_foreign_key "my_guides", "users"
  add_foreign_key "reminders", "my_guides"
  add_foreign_key "reminders", "users"
  add_foreign_key "sub_categories", "categories"
end
