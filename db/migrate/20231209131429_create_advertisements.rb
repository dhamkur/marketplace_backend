class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :name
      t.string :page_type
      t.decimal :starting_price, default: 0
      t.boolean :is_available, default: false

      t.timestamps
    end
  end
end
