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

ActiveRecord::Schema.define(version: 20160117015331) do

  create_table "model_types", force: :cascade do |t|
    t.integer "model_id",        null: false
    t.string  "name",            null: false
    t.string  "model_type_slug", null: false
    t.string  "model_type_code", null: false
    t.integer "base_price",      null: false
  end

  add_index "model_types", ["model_id"], name: "index_model_types_on_model_id"
  add_index "model_types", ["model_type_slug"], name: "index_model_types_on_model_type_slug", unique: true

  create_table "models", force: :cascade do |t|
    t.string  "name",            null: false
    t.string  "model_slug",      null: false
    t.integer "organization_id"
  end

  add_index "models", ["model_slug"], name: "index_models_on_model_slug", unique: true
  add_index "models", ["organization_id"], name: "index_models_on_organization_id"

  create_table "organizations", force: :cascade do |t|
    t.string "name",           null: false
    t.string "public_name",    null: false
    t.string "type",           null: false
    t.string "pricing_policy", null: false
  end

end
