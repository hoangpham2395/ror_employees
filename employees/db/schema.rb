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

ActiveRecord::Schema.define(version: 20180327152102) do

  create_table "demos", force: :cascade do |t|
    t.string "a"
    t.string "b"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leavedays", force: :cascade do |t|
    t.integer "user_id"
    t.date "leave_datetime"
    t.float "leave_hour"
    t.string "leave_reason"
    t.string "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ots", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.date "ot_datetime"
    t.float "ot_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_status"
    t.date "start_datetime"
    t.date "end_datetime"
    t.integer "user_id"
    t.string "project_lang"
    t.string "description"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "user_type"
    t.string "join_status"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "fullname"
    t.string "email_company"
    t.string "email_personal"
    t.string "tel"
    t.integer "gender"
    t.date "birthday"
    t.string "image"
    t.string "department"
    t.string "position"
    t.string "skill"
    t.string "literacy"
    t.string "contract_type"
    t.string "status"
    t.string "address"
    t.string "bank_account"
    t.string "id_number"
    t.string "description"
    t.date "join_datetime"
    t.date "exit_datetime"
    t.float "leavedays_have"
    t.float "leavedays_took"
    t.string "leavedays_note"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
  end

end
