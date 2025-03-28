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

ActiveRecord::Schema[7.0].define(version: 2023_12_09_120249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "quantity", default: 0
    t.decimal "amount", default: "0.0"
    t.decimal "total_amount", default: "0.0"
    t.boolean "is_selected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "userable_id"
    t.string "userable_type"
    t.integer "total_product", default: 0
    t.decimal "total_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userable_id"], name: "index_carts_on_userable_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "merchant_name"
    t.text "merchant_address"
    t.text "avatar_data"
    t.string "pic_name"
    t.string "pic_phone_number"
    t.text "pic_address"
    t.string "instagram"
    t.string "tiktok"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_merchants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_merchants_on_reset_password_token", unique: true
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "photoable_id"
    t.string "photoable_type"
    t.text "image_data"
    t.boolean "is_thumbnail", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photoable_id"], name: "index_photos_on_photoable_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.decimal "amount", default: "0.0"
    t.decimal "discount", default: "0.0"
    t.integer "stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "merchant_id"
    t.bigint "category_id"
    t.string "name"
    t.text "description"
    t.decimal "starting_price", default: "0.0"
    t.string "slug"
    t.decimal "delivery_fee", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["merchant_id"], name: "index_products_on_merchant_id"
    t.index ["slug"], name: "index_products_on_slug"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "promo_type"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promotions_on_code"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.string "tax_type"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "top_ups", force: :cascade do |t|
    t.string "code"
    t.decimal "amount", default: "0.0"
    t.string "status"
    t.bigint "userable_id"
    t.string "userable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userable_id"], name: "index_top_ups_on_userable_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "label"
    t.text "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zip_code"
    t.boolean "is_default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_banks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bank_id"
    t.string "account_holder"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_user_banks_on_bank_id"
    t.index ["user_id"], name: "index_user_banks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.text "avatar_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallet_histories", force: :cascade do |t|
    t.bigint "wallet_id"
    t.string "amount_type"
    t.decimal "amount", default: "0.0"
    t.bigint "transactionable_id"
    t.string "transactionable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transactionable_id"], name: "index_wallet_histories_on_transactionable_id"
    t.index ["wallet_id"], name: "index_wallet_histories_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.bigint "userable_id"
    t.string "userable_type"
    t.decimal "amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userable_id"], name: "index_wallets_on_userable_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlists_on_product_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  create_table "withdrawals", force: :cascade do |t|
    t.bigint "userable_id"
    t.string "userable_type"
    t.string "bank_name"
    t.string "account_holder"
    t.string "account_number"
    t.decimal "amount", default: "0.0"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userable_id"], name: "index_withdrawals_on_userable_id"
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "merchants"
  add_foreign_key "user_addresses", "users"
  add_foreign_key "user_banks", "banks"
  add_foreign_key "user_banks", "users"
  add_foreign_key "wallet_histories", "wallets"
  add_foreign_key "wishlists", "products"
  add_foreign_key "wishlists", "users"
end
