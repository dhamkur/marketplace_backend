class AddProofOfTransferToWalletHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :wallet_histories, :proof_of_transfer_data, :text
  end
end
