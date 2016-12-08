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

ActiveRecord::Schema.define(version: 20161207201430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.date    "date"
    t.string  "events"
    t.integer "max_temperature_f"
    t.integer "mean_temperature_f"
    t.integer "min_temperature_f"
    t.integer "max_dew_point_f"
    t.integer "mean_dew_point_f"
    t.integer "min_dew_point_f"
    t.integer "max_humidity"
    t.integer "mean_humidity"
    t.integer "min_humidity"
    t.integer "max_sea_level_pressure_inches"
    t.integer "mean_sea_level_pressure_inches"
    t.integer "min_sea_level_pressure_inches"
    t.integer "max_visibility_miles"
    t.integer "mean_visibility_miles"
    t.integer "min_visibility_miles"
    t.integer "max_wind_speed_mph"
    t.integer "mean_wind_speed_mph"
    t.integer "min_wind_speed_mph"
    t.integer "precipitation_inches"
    t.integer "cloud_cover"
    t.integer "wind_dir_degrees"
    t.integer "zip_code"
    t.integer "max_gust_speed_mph"
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.integer  "dock_count"
    t.integer  "city_id"
    t.date     "installation_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint   "duration"
    t.bigint   "start_station_id"
    t.bigint   "end_station_id"
    t.bigint   "bike_id"
    t.bigint   "subscription_id"
    t.bigint   "zipcode"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "start_date"
    t.date     "end_date"
  end

end
