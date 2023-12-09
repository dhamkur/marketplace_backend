class CreateWalletHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_histories do |t|
      t.references :wallet, null: true, foreign_key: true
      t.string :amount_type
      t.decimal :amount, default: 0
      t.bigint :transactionable_id, index: true
      t.string :transactionable_type
      t.string :status
      t.string :code, index: true
      t.string :history_type

      t.timestamps
    end
  end
end
