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

ActiveRecord::Schema.define(version: 20140209102541) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "option_id"
    t.integer  "question_id"
  end

  create_table "options", force: true do |t|
    t.string   "response_option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_id"
  end

  create_table "question_groups", force: true do |t|
    t.string   "survey_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "inquiry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_group_id"
  end

  create_table "surveys", force: true do |t|
    t.text     "json_input"
    t.text     "json_output"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
