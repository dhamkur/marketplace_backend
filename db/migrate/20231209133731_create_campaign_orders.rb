class CreateCampaignOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :campaign_orders do |t|
      t.references :campaign, null: true, foreign_key: true
      t.string :code, index: true
      t.string :status
      t.decimal :sub_total, default: 0
      t.decimal :tax_amount, default: 0
      t.references :tax, null: true, foreign_key: true
      t.string :payment_method
      t.decimal :total_payment, default: 0

      t.timestamps
    end
  end
end
