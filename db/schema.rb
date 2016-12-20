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

ActiveRecord::Schema.define(version: 20161220032228) do

  create_table "pictures", force: :cascade do |t|
    t.integer "user_id"
    t.string  "image_url"
    t.text    "caption"
  end

  create_table "stories", force: :cascade do |t|
    t.integer "user_id"
    t.string  "story_title"
    t.string  "story_image"
    t.text    "story_body"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.string   "location"
    t.text     "features"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rating"
    t.string   "difficulty"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  create_table "videos", force: :cascade do |t|
    t.integer "user_id"
    t.string  "video_url"
    t.string  "video_title"
    t.text    "video_description"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

end
