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

ActiveRecord::Schema.define(version: 20150427233918) do

  create_table "myallitems", force: :cascade do |t|
    t.string   "barcode"
    t.string   "name"
    t.string   "unit"
    t.float    "price"
    t.float    "count"
    t.string   "classfy"
    t.float    "freeCount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "myfreelists", force: :cascade do |t|
    t.string   "classfy"
    t.string   "name"
    t.float    "freeCount"
    t.float    "count"
    t.string   "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mypromotions", force: :cascade do |t|
    t.string   "barcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "myshoppinglists", force: :cascade do |t|
    t.string   "classfy"
    t.string   "name"
    t.string   "unit"
    t.float    "price"
    t.float    "count"
    t.float    "freeCount"
    t.float    "allsum"
    t.float    "promotionsum"
    t.string   "barcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "promotionlists", force: :cascade do |t|
    t.string   "barcode"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
