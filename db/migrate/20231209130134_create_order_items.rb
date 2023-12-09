class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: true, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :amount, default: 0
      t.decimal :delivery_fee, default: 0
      t.decimal :total_amount, default: 0
      t.string :delivery_tracking_code
      t.string :status
      t.string :delivery_method

      t.timestamps
    end
  end
end
