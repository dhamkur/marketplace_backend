class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.bigint :userable_id
      t.string :userable_type
      t.integer :total_product, default: 0
      t.decimal :total_amount, default: 0

      t.timestamps
    end

    add_index :carts, :userable_id
  end
end
