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

ActiveRecord::Schema.define(version: 20180413095017) do

  create_table "employees", force: :cascade do |t|
    t.string "username"
    t.string "fullname"
    t.string "email_company"
    t.string "email_personal"
    t.string "tel"
    t.integer "gender" #1:male, 2:female
    t.date "birthday"
    t.string "department"
    t.string "position"
    t.string "skill"
    t.string "literacy"
    t.string "contract_type"
    t.string "status"
    t.string "address"
    t.string "bank_account"
    t.string "id_number"
    t.date "join_datetime"
    t.date "exit_datetime"
    t.float "leavedays_have"
    t.float "leavedays_took"
    t.string "leavedays_note"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "del_flag"
    t.string "description"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "leavedays", force: :cascade do |t|
    t.integer "employee_id"
    t.date "leave_datetime"
    t.float "leave_hour"
    t.string "leave_reason"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leavedays_on_employee_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.string "join_status"
    t.integer "user_type" #0:leader, 1:member
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_members_on_employee_id"
    t.index ["project_id"], name: "index_members_on_project_id"
  end

  create_table "ots", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.date "ot_datetime"
    t.float "ot_hour"
    t.string "ot_reason"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_ots_on_employee_id"
    t.index ["project_id"], name: "index_ots_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_status"
    t.date "start_datetime"
    t.date "end_datetime"
    t.string "project_lang"
    t.string "description"
    t.integer "del_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
