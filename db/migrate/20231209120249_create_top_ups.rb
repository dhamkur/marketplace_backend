class CreateTopUps < ActiveRecord::Migration[7.0]
  def change
    create_table :top_ups do |t|
      t.string :code
      t.decimal :amount, default: 0
      t.string :status
      t.bigint :userable_id
      t.string :userable_type

      t.timestamps
    end

    add_index :top_ups, :userable_id
  end
end
