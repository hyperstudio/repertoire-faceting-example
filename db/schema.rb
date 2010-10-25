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

ActiveRecord::Schema.define(:version => 0) do

  create_table "_citizens_birth_place_facet", :id => false, :force => true do |t|
    t.text   "birth_place1"
    t.text   "birth_place2"
    t.string "signature",    :limit => nil
  end

  create_table "_citizens_birthdate_facet", :id => false, :force => true do |t|
    t.float  "birthdate1"
    t.text   "birthdate2"
    t.float  "birthdate3"
    t.string "signature",  :limit => nil
  end

  create_table "_citizens_gender_facet", :id => false, :force => true do |t|
    t.text   "gender"
    t.string "signature", :limit => nil
  end

  create_table "_citizens_occupation_facet", :id => false, :force => true do |t|
    t.text   "occupation"
    t.string "signature",  :limit => nil
  end

  create_table "_nobelists_degree_facet", :id => false, :force => true do |t|
    t.text   "degree"
    t.string "signature", :limit => nil
  end

  create_table "affiliations", :force => true do |t|
    t.integer "nobelist_id", :null => false
    t.text    "detail",      :null => false
    t.text    "degree"
    t.integer "year"
  end

  create_table "cities", :id => false, :force => true do |t|
    t.integer "id",                      :null => false
    t.text    "city"
    t.text    "state"
    t.string  "state_abbr", :limit => 2
    t.integer "population"
    t.float   "low"
    t.float   "high"
  end

  add_index "cities", ["high"], :name => "cities_high_idx"
  add_index "cities", ["low"], :name => "cities_low_idx"

# Could not dump table "citizens" because of following StandardError
#   Unknown type 'tsvector' for column '_fulltext'

  create_table "female_names", :id => false, :force => true do |t|
    t.text    "name"
    t.float   "frequency"
    t.integer "total"
    t.integer "id",        :null => false
    t.float   "low"
    t.float   "high"
  end

  add_index "female_names", ["high"], :name => "female_names_high_idx"
  add_index "female_names", ["low"], :name => "female_names_low_idx"

  create_table "male_names", :id => false, :force => true do |t|
    t.text    "name"
    t.float   "frequency"
    t.integer "total"
    t.integer "id",        :null => false
    t.float   "low"
    t.float   "high"
  end

  add_index "male_names", ["high"], :name => "male_names_high_idx"
  add_index "male_names", ["low"], :name => "male_names_low_idx"

  create_table "nobelists", :force => true do |t|
    t.text     "name",          :null => false
    t.datetime "birthdate"
    t.datetime "deathdate"
    t.text     "birth_country"
    t.text     "birth_state"
    t.text     "birth_city"
    t.text     "url"
    t.text     "discipline"
    t.boolean  "shared"
    t.text     "last_name",     :null => false
    t.integer  "nobel_year",    :null => false
    t.boolean  "deceased"
    t.text     "co_winner"
    t.text     "image_url"
    t.text     "image_credit"
    t.integer  "_packed_id"
  end

  add_index "nobelists", ["_packed_id"], :name => "nobelists__packed_id_ndx"

  create_table "occupations", :force => true do |t|
    t.text "name"
  end

  create_table "surnames", :id => false, :force => true do |t|
    t.text    "name"
    t.float   "frequency"
    t.integer "total"
    t.integer "id",        :null => false
    t.float   "low"
    t.float   "high"
  end

  add_index "surnames", ["high"], :name => "surnames_high_idx"
  add_index "surnames", ["low"], :name => "surnames_low_idx"

end
