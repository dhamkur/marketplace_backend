class RollbackStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :product_variants, :status, :string
    add_column :order_items, :status, :string
  end
end
