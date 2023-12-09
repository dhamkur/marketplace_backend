class CreateTopUps < ActiveRecord::Migration[7.0]
  def change
    create_table :top_ups do |t|
      t.string :code, index: true
      t.decimal :amount, default: 0
      t.string :status
      t.bigint :userable_id, index: true
      t.string :userable_type

      t.timestamps
    end
  end
end
