# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_07_130009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projets", force: :cascade do |t|
    t.string "name_structure"
    t.string "title"
    t.string "url"
    t.string "keywords"
    t.string "difficulty"
    t.date "date"
    t.boolean "live"
    t.text "synopsis"
    t.string "image"
    t.string "territory"
    t.string "duration"
    t.boolean "stars"
    t.text "stars_text"
    t.bigint "theme_id", null: false
    t.bigint "target_id", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_projets_on_form_id"
    t.index ["target_id"], name: "index_projets_on_target_id"
    t.index ["theme_id"], name: "index_projets_on_theme_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "projets", "forms"
  add_foreign_key "projets", "targets"
  add_foreign_key "projets", "themes"
end
