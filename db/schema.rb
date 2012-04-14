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

ActiveRecord::Schema.define(:version => 20120404142137) do

  create_table "bodies", :force => true do |t|
    t.text     "body_id"
    t.text     "alt_id"
    t.integer  "body_type_id"
    t.integer  "constellation_id"
    t.time     "right_ascension"
    t.float    "declination"
    t.float    "magnitude"
    t.float    "surface_brightness"
    t.integer  "uranometria"
    t.integer  "sky_atlas_2000"
    t.integer  "pocket_sky_atlas"
    t.float    "size_max"
    t.float    "size_min"
    t.integer  "position_angle"
    t.text     "class_id"
    t.integer  "number_of_stars"
    t.float    "brightest_star_mag"
    t.string   "ngc_description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "body_types", :force => true do |t|
    t.text     "abbr"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "catalogs", :force => true do |t|
    t.string   "catalog"
    t.string   "catalog_num"
    t.integer  "body_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "catalogs", ["body_id"], :name => "index_catalogs_on_body_id"

  create_table "constellations", :force => true do |t|
    t.text     "abbr"
    t.text     "constellation"
    t.text     "genitive"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "observations", :force => true do |t|
    t.date     "obs_date"
    t.time     "obs_time"
    t.integer  "seeing"
    t.integer  "transparency"
    t.text     "notes"
    t.integer  "session_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "body_id"
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
