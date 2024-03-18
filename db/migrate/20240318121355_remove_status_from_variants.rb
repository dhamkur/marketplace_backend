class RemoveStatusFromVariants < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_variants, :status, :string
    remove_column :order_items, :status, :string
  end
end
