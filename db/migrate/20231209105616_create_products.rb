class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :merchant, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :starting_price, default: 0
      t.string :slug
      t.decimal :delivery_fee, default: 0
      t.index :slug

      t.timestamps
    end
  end
end
