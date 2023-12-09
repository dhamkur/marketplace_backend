class CreateWithdrawals < ActiveRecord::Migration[7.0]
  def change
    create_table :withdrawals do |t|
      t.bigint :userable_id, index: true
      t.string :userable_type
      t.string :bank_name
      t.string :account_holder
      t.string :account_number
      t.decimal :amount, default: 0
      t.string :status
      t.string :code, index: true

      t.timestamps
    end
  end
end
