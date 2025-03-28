class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.bigint :userable_id
      t.string :userable_type
      t.decimal :amount, default: 0

      t.timestamps
    end

    add_index :wallets, :userable_id
  end
end
