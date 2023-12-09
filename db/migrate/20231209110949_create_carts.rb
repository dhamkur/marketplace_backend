class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.bigint :userable_id, index: true
      t.string :userable_type
      t.integer :total_product, default: 0
      t.decimal :total_amount, default: 0

      t.timestamps
    end
  end
end
