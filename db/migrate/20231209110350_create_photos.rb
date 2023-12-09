class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.bigint :photoable_id, index: true
      t.string :photoable_type
      t.text :image_data
      t.boolean :is_thumbnail, default: false

      t.timestamps
    end
  end
end
