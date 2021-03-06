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

ActiveRecord::Schema.define(version: 20150207171540) do

  create_table "employees", force: true do |t|
    t.string   "firstname"
    t.string   "midname"
    t.string   "lastname"
    t.string   "pesel"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal"
    t.string   "country"
    t.string   "phone"
    t.string   "gender"
    t.string   "department"
    t.date     "birthdate"
    t.date     "hiredate"
    t.string   "email"
    t.integer  "hrsperweek"
    t.decimal  "wage"
    t.string   "nationality"
    t.string   "marital"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                        default: "",   null: false
    t.string   "encrypted_password",           default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "otp_secret_key"
    t.integer  "second_factor_attempts_count", default: 0
    t.string   "phone_number"
    t.boolean  "active_sms",                   default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["otp_secret_key"], name: "index_users_on_otp_secret_key", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
