class CreateUserBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_banks do |t|
      t.references :user, null: true, foreign_key: true
      t.references :bank, null: true, foreign_key: true
      t.string :account_holder
      t.string :account_number

      t.timestamps
    end
  end
end
