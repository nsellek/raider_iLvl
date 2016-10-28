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

ActiveRecord::Schema.define(version: 20161028000213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guild_members", force: :cascade do |t|
    t.string   "name"
    t.string   "realm"
    t.integer  "guild_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "level"
    t.string   "ilvl"
    t.json     "items"
    t.index ["guild_id"], name: "index_guild_members_on_guild_id", using: :btree
  end

  create_table "guilds", force: :cascade do |t|
    t.string   "guild_name"
    t.string   "realm"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guilds_on_user_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "realm"
    t.integer  "iLvl"
    t.string   "spec"
    t.integer  "raid_group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["raid_group_id"], name: "index_members_on_raid_group_id", using: :btree
  end

  create_table "raid_groups", force: :cascade do |t|
    t.string   "group_name"
    t.string   "average_ilvl"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "guild_id"
    t.index ["guild_id"], name: "index_raid_groups_on_guild_id", using: :btree
  end

  create_table "raid_members", force: :cascade do |t|
    t.integer  "guild_member_id"
    t.integer  "raid_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["guild_member_id"], name: "index_raid_members_on_guild_member_id", using: :btree
    t.index ["raid_group_id"], name: "index_raid_members_on_raid_group_id", using: :btree
  end

  create_table "realms", force: :cascade do |t|
    t.string   "realm_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "guild_id"
  end

  add_foreign_key "guild_members", "guilds"
  add_foreign_key "guilds", "users"
  add_foreign_key "raid_groups", "guilds"
  add_foreign_key "raid_members", "guild_members"
  add_foreign_key "raid_members", "raid_groups"
end
