class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: true, foreign_key: true
      t.references :promotion, null: true, foreign_key: true
      t.string :code, index: true
      t.string :applied_promo
      t.decimal :sub_total, default: 0
      t.decimal :discount, default: 0
      t.decimal :total_payment, default: 0
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.decimal :used_wallet, default: 0
      t.string :status
      t.string :payment_method
      t.decimal :total_delivery_fee, default: 0
      t.decimal :tax_amount, default: 0
      t.references :tax, null: true, foreign_key: true
      t.string :xendit_invoice_url
      t.string :xendit_external_id

      t.timestamps
    end
  end
end
