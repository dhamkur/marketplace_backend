class AddProductVariantToMultipleTables < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :product_variant_id, :bigint, index: true, foreign_key: true
    add_column :cart_items, :product_variant_id, :bigint, index: true, foreign_key: true
  end
end
