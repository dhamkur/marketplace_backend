# == Schema Information
#
# Table name: wallet_histories
#
#  id                   :bigint           not null, primary key
#  wallet_id            :bigint
#  amount_type          :string
#  amount               :decimal(, )      default(0.0)
#  transactionable_id   :bigint
#  transactionable_type :string
#  status               :string
#  code                 :string
#  history_type         :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Wallet::History < ApplicationRecord
  belongs_to :wallet
  belongs_to :transactionable, polymorphic: true, optional: true
end
