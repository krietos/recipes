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

ActiveRecord::Schema.define(version: 20140403215616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredient_recipes", force: true do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  create_table "ingredients", force: true do |t|
    t.string "name"
  end

  create_table "ratings", force: true do |t|
    t.integer "rating"
    t.integer "recipe_id"
  end

  create_table "recipe_tags", force: true do |t|
    t.integer "tag_id"
    t.integer "recipe_id"
  end

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

end
