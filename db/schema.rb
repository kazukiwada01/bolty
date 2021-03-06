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

ActiveRecord::Schema.define(version: 2022_03_05_051824) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "gyms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "prefecture_id", null: false
    t.string "city_name", null: false
    t.string "street", null: false
    t.string "building_name"
    t.text "gym_url", null: false
    t.bigint "admin_id", null: false
    t.index ["admin_id"], name: "index_gyms_on_admin_id"
  end

  create_table "partners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company", null: false
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number", null: false
    t.text "message", null: false
  end

  create_table "problem_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "admin_id", null: false
    t.bigint "gym_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_problem_lists_on_admin_id"
    t.index ["gym_id"], name: "index_problem_lists_on_gym_id"
  end

  create_table "problems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.integer "grade_id", null: false
    t.integer "holding", null: false
    t.integer "physical", null: false
    t.integer "move", null: false
    t.integer "positioning", null: false
    t.integer "footwork", null: false
    t.integer "coordination", null: false
    t.bigint "admin_id", null: false
    t.bigint "problem_list_id", null: false
    t.index ["admin_id"], name: "index_problems_on_admin_id"
    t.index ["problem_list_id"], name: "index_problems_on_problem_list_id"
  end

  create_table "results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "climb", null: false
    t.integer "holding", null: false
    t.integer "physical", null: false
    t.integer "move", null: false
    t.integer "positioning", null: false
    t.integer "footwork", null: false
    t.integer "coordination", null: false
    t.bigint "user_id", null: false
    t.bigint "gym_id", null: false
    t.bigint "problem_id", null: false
    t.index ["gym_id"], name: "index_results_on_gym_id"
    t.index ["problem_id"], name: "index_results_on_problem_id"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "gyms", "admins"
  add_foreign_key "problem_lists", "admins"
  add_foreign_key "problem_lists", "gyms"
  add_foreign_key "problems", "admins"
  add_foreign_key "problems", "problem_lists"
  add_foreign_key "results", "gyms"
  add_foreign_key "results", "problems"
  add_foreign_key "results", "users"
end
