class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.references :merchant, null: true, foreign_key: true
      t.references :advertisement_placement, null: true, foreign_key: true
      t.string :name
      t.text :image_data
      t.string :destination_link
      t.datetime :start_date
      t.datetime :end_date
      t.string :duration
      t.string :status

      t.timestamps
    end
  end
end
