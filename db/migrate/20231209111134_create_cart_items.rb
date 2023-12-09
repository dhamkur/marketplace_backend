class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: true, foreign_key: true
      t.references :product, null: true, foreign_key: true
      t.integer :quantity, default: 0
      t.decimal :amount, default: 0
      t.decimal :total_amount, default: 0
      t.boolean :is_selected, default: false

      t.timestamps
    end
  end
end
