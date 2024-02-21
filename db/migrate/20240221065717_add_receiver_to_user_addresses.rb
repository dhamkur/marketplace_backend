class AddReceiverToUserAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :user_addresses, :receiver, :string
    add_column :user_addresses, :phone_number, :string
  end
end
