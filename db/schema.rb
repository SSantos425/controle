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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_001118) do
  create_table "carrinho_items", force: :cascade do |t|
    t.integer "carrinho_id", null: false
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrinho_id"], name: "index_carrinho_items_on_carrinho_id"
    t.index ["produto_id"], name: "index_carrinho_items_on_produto_id"
  end

  create_table "carrinhos", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carrinhos_on_user_id"
  end

  create_table "carteiras", force: :cascade do |t|
    t.float "saldo"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carteiras_on_user_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.integer "quantidade"
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "produto_id", null: false
    t.integer "quantidade"
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produto_id"], name: "index_vendas_on_produto_id"
    t.index ["user_id"], name: "index_vendas_on_user_id"
  end

  add_foreign_key "carrinho_items", "carrinhos"
  add_foreign_key "carrinho_items", "produtos"
  add_foreign_key "carrinhos", "users"
  add_foreign_key "carteiras", "users"
  add_foreign_key "vendas", "produtos"
  add_foreign_key "vendas", "users"
end
