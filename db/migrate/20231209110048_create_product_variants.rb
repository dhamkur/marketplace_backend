class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: true, foreign_key: true
      t.string :name
      t.decimal :amount, default: 0
      t.decimal :discount, default: 0
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
