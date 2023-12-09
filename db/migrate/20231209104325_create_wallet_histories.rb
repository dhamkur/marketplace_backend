class CreateWalletHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_histories do |t|
      t.references :wallet, null: true, foreign_key: true
      t.string :amount_type
      t.decimal :amount, default: 0
      t.bigint :transactionable_id
      t.string :transactionable_type

      t.timestamps
    end

    add_index :wallet_histories, :transactionable_id
  end
end
