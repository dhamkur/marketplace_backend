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
  include General

  AMOUNT_TYPE = ["in", "out"]
  TYPE = ["top_up", "withdrawal", "order"]

  belongs_to :wallet
  belongs_to :transactionable, polymorphic: true, optional: true

  validates :amount_type, inclusion: { in: AMOUNT_TYPE }
  validates :history_type, inclusion: { in: TYPE }
  validates :status, inclusion: { in: Transaction::STATUS }

  scope :my_history, -> (wallet_id, status) { where(wallet_id: wallet_id, status: status) }

  before_validation :set_status
end
