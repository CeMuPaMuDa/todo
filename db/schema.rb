# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_21_143730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", comment: "Задача(событие)", force: :cascade do |t|
    t.string "title", comment: "Название задачи"
    t.text "description", comment: "Краткое описание задачи"
    t.boolean "completed", default: false, comment: "Завершена? Да (true) / Нет (false)"
    t.datetime "deadline", comment: "Дата и время завершения (по плану)"
    t.bigint "user_id", comment: "Внешний ключ для связи с таблицей users"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "items", comment: "Часть задачи(события)", force: :cascade do |t|
    t.string "title", comment: "Название подзадачи"
    t.text "description", comment: "Краткое описание подзадачи"
    t.boolean "completed", default: false, comment: "Завершена? Да (true) / Нет (false)"
    t.datetime "deadline", comment: "Дата и время завершения (по плану)"
    t.bigint "event_id", comment: "Внешний ключ для связи с таблицей events"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_items_on_event_id"
  end

  create_table "roles", comment: "Роль пользователей", force: :cascade do |t|
    t.string "name", comment: "Название англ: Administrator, User"
    t.string "alias_name", comment: "Псевдоним на рус."
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", comment: "Пользователь приложения", force: :cascade do |t|
    t.string "name", comment: "Имя(никнейм/логин) пользователя"
    t.string "email", comment: "E-mail пользователя"
    t.boolean "active", default: true, comment: "Состояние пользователя: активен(true), забанен(false)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role_id", comment: "Роль пользователя"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "authentication_token"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "users"
  add_foreign_key "items", "events"
  add_foreign_key "users", "roles"
end
