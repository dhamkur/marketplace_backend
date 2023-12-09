class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :code, index: true
      t.string :name
      t.string :promo_type
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
