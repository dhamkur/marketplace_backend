class CreateAdvertisementPlacements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisement_placements do |t|
      t.references :advertisement, null: true, foreign_key: true
      t.string :name
      t.decimal :amount, default: 0
      t.string :duration
      t.text :image_data
      t.integer :available_slot, default: 0

      t.timestamps
    end
  end
end
