class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: true, foreign_key: true
      t.string :label
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.boolean :is_default, default: false

      t.timestamps
    end
  end
end
