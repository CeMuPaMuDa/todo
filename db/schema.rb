ActiveRecord::Schema.define(version: 2021_12_15_140608) do

  enable_extension "plpgsql"

  create_table "users", comment: "Пользователь приложения", force: :cascade do |t|
    t.string "name", comment: "Имя(никнейм/логин) пользователя"
    t.string "email", comment: "E-mail пользователя"
    t.boolean "active", default: true, comment: "Состояние пользователя: активен(true), забанен(false)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
