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

ActiveRecord::Schema.define(version: 20160511004209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_players", force: :cascade do |t|
    t.integer  "fantasy_player_id"
    t.integer  "fantasy_league_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "active_players", ["fantasy_league_id"], name: "index_active_players_on_fantasy_league_id", using: :btree
  add_index "active_players", ["fantasy_player_id"], name: "index_active_players_on_fantasy_player_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "fantasy_leagues", force: :cascade do |t|
    t.string   "division"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fantasy_players", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "sports_league_id"
  end

  add_index "fantasy_players", ["sports_league_id"], name: "index_fantasy_players_on_sports_league_id", using: :btree

  create_table "fantasy_teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "fantasy_league_id"
    t.integer  "franchise_id"
  end

  add_index "fantasy_teams", ["fantasy_league_id"], name: "index_fantasy_teams_on_fantasy_league_id", using: :btree
  add_index "fantasy_teams", ["franchise_id"], name: "index_fantasy_teams_on_franchise_id", using: :btree

  create_table "final_rankings", force: :cascade do |t|
    t.integer  "fantasy_player_id"
    t.integer  "year"
    t.integer  "rank"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "points"
    t.integer  "winnings"
  end

  add_index "final_rankings", ["fantasy_player_id"], name: "index_final_rankings_on_fantasy_player_id", using: :btree

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roster_positions", force: :cascade do |t|
    t.integer  "fantasy_player_id"
    t.integer  "fantasy_team_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "roster_positions", ["fantasy_player_id"], name: "index_roster_positions_on_fantasy_player_id", using: :btree
  add_index "roster_positions", ["fantasy_team_id"], name: "index_roster_positions_on_fantasy_team_id", using: :btree

  create_table "sports_leagues", force: :cascade do |t|
    t.string   "name"
    t.date     "waiver_deadline"
    t.date     "trade_deadline"
    t.date     "championship_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",                                          null: false
    t.boolean  "admin",                          default: false, null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.integer  "franchise_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["franchise_id"], name: "index_users_on_franchise_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "active_players", "fantasy_leagues"
  add_foreign_key "active_players", "fantasy_players"
  add_foreign_key "fantasy_players", "sports_leagues"
  add_foreign_key "fantasy_teams", "fantasy_leagues"
  add_foreign_key "fantasy_teams", "franchises"
  add_foreign_key "final_rankings", "fantasy_players"
  add_foreign_key "roster_positions", "fantasy_players"
  add_foreign_key "roster_positions", "fantasy_teams"
  add_foreign_key "users", "franchises"
end
