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

ActiveRecord::Schema.define(version: 2020_01_26_084954) do

  create_table "cals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "g1"
    t.integer "g2"
    t.integer "g3"
    t.integer "g4"
    t.integer "g5"
    t.integer "g6"
    t.integer "g7"
    t.integer "g8"
    t.integer "g9"
    t.integer "g10"
    t.integer "t1"
    t.integer "t2"
    t.integer "t3"
    t.integer "t4"
    t.integer "t5"
    t.integer "t6"
    t.integer "t7"
    t.integer "t8"
    t.integer "t9"
    t.integer "t10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "graphs"
    t.integer "totals"
    t.integer "averages"
    t.integer "a1"
    t.integer "a2"
    t.integer "a3"
    t.integer "a4"
    t.integer "a5"
    t.integer "a6"
    t.integer "a7"
    t.integer "a8"
    t.integer "a9"
    t.integer "a10"
  end

  create_table "costs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "edu_cost"
    t.integer "old_cost"
    t.integer "target"
    t.integer "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "marriage_cost"
    t.integer "myhome_cost"
  end

  create_table "plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "marriage"
    t.integer "sons"
    t.integer "birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "retirement"
    t.integer "severance"
    t.integer "when_marriage"
    t.string "wedding"
    t.integer "first_son"
    t.integer "last_son"
    t.string "myhome"
    t.integer "when_myhome"
    t.integer "saving"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
