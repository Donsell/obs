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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120309223858) do

  create_table "observations", :force => true do |t|
    t.date     "obs_date"
    t.time     "obs_time"
    t.integer  "seeing"
    t.integer  "transparency"
    t.text     "notes"
    t.integer  "session_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "observations", ["session_id"], :name => "index_observations_on_session_id"

  create_table "sessions", :force => true do |t|
    t.date     "begin_date"
    t.time     "begin_time"
    t.string   "location"
    t.integer  "seeing"
    t.integer  "transparency"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
