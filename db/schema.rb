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

ActiveRecord::Schema.define(version: 20161127181807) do

  create_table "alerters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uuid"
    t.integer  "supported_targets"
    t.datetime "heartbeat_received_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "deleted_at"
  end

  create_table "alerts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "cooldown"
    t.integer  "alert_method"
    t.string   "alert_target"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "is_enabled"
    t.integer  "minimum_severity"
    t.integer  "team_id"
    t.datetime "deleted_at"
    t.boolean  "is_silenced"
    t.index ["team_id"], name: "index_alerts_on_team_id", using: :btree
  end

  create_table "checks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category"
    t.string   "name"
    t.string   "condition_query"
    t.integer  "condition_operand"
    t.integer  "condition_aggregator"
    t.integer  "severity"
    t.integer  "interval"
    t.boolean  "is_locked"
    t.datetime "last_ran_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "team_id"
    t.integer  "datasource_id"
    t.datetime "deleted_at"
    t.string   "documentation_url",               default: "http://"
    t.float    "condition_value",      limit: 24
    t.index ["datasource_id"], name: "index_checks_on_datasource_id", using: :btree
    t.index ["team_id"], name: "index_checks_on_team_id", using: :btree
  end

  create_table "datasources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sourcetype"
    t.string   "address"
    t.integer  "port"
    t.string   "protocol"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.string   "index"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "message"
    t.integer  "kind"
    t.integer  "severity"
    t.integer  "team_id"
    t.datetime "deleted_at"
    t.index ["team_id"], name: "index_events_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "password"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "role"
    t.integer  "team_id"
    t.datetime "deleted_at"
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uuid"
    t.integer  "supported_sourcetype"
    t.datetime "heartbeat_received_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "deleted_at"
  end

  add_foreign_key "alerts", "teams"
  add_foreign_key "checks", "datasources"
  add_foreign_key "checks", "teams"
  add_foreign_key "events", "teams"
  add_foreign_key "users", "teams"
end
