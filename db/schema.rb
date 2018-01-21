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

ActiveRecord::Schema.define(version: 20180121012842) do

  create_table "exercise_goal_defaults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_type_id", null: false
    t.index ["exercise_type_id"], name: "index_exercise_goal_defaults_on_exercise_type_id"
  end

  create_table "exercise_goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_goals_on_exercise_id"
  end

  create_table "exercise_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_goal_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_goal_id"], name: "index_exercise_results_on_exercise_goal_id"
    t.index ["exercise_id"], name: "index_exercise_results_on_exercise_id"
  end

  create_table "exercise_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "description"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration", null: false
  end

  create_table "exercise_types_metrics", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_type_id", null: false
    t.bigint "metric_id", null: false
    t.index ["exercise_type_id", "metric_id"], name: "index_exercise_types_metrics_on_exercise_type_id_and_metric_id"
  end

  create_table "exercises", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_type_id", null: false
    t.bigint "user_id", null: false
    t.boolean "done", default: false
    t.integer "duration", null: false
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "measurements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "value", limit: 24, null: false
    t.bigint "took_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "metric_id", null: false
    t.bigint "exercise_id", null: false
    t.index ["exercise_id"], name: "index_measurements_on_exercise_id"
    t.index ["metric_id"], name: "index_measurements_on_metric_id"
  end

  create_table "metric_goal_defaults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_goal_default_id"
    t.bigint "metric_id"
    t.float "goal", limit: 24
    t.string "aggregator"
    t.string "comparator"
    t.index ["exercise_goal_default_id"], name: "index_metric_goal_defaults_on_exercise_goal_default_id"
    t.index ["metric_id"], name: "index_metric_goal_defaults_on_metric_id"
  end

  create_table "metric_goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_goal_id"
    t.bigint "metric_id"
    t.float "goal", limit: 24
    t.string "aggregator"
    t.string "comparator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_goal_id"], name: "index_metric_goals_on_exercise_goal_id"
    t.index ["metric_id"], name: "index_metric_goals_on_metric_id"
  end

  create_table "metric_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "exercise_result_id"
    t.bigint "metric_goal_id"
    t.float "actual", limit: 24
    t.boolean "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_result_id"], name: "index_metric_results_on_exercise_result_id"
    t.index ["metric_goal_id"], name: "index_metric_results_on_metric_goal_id"
  end

  create_table "metrics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.bigint "sensor_id", null: false
    t.float "min", limit: 24
    t.float "max", limit: 24
    t.string "unit"
    t.index ["sensor_id"], name: "index_metrics_on_sensor_id"
  end

  create_table "sensors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
