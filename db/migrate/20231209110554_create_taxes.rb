class CreateTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxes do |t|
      t.string :name
      t.string :tax_type
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
