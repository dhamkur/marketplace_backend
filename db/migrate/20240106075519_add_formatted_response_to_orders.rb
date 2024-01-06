class AddFormattedResponseToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :formatted_response, :jsonb
  end
end
