# == Schema Information
#
# Table name: withdrawals
#
#  id             :bigint           not null, primary key
#  userable_id    :bigint
#  userable_type  :string
#  bank_name      :string
#  account_holder :string
#  account_number :string
#  amount         :decimal(, )      default(0.0)
#  status         :string
#  code           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Withdrawal < ApplicationRecord
  include General

  belongs_to :userable, polymorphic: true

  has_one :wallet_history, class_name: "Wallet::History", foreign_key: "transactionable_id"

  validates :code, uniqueness: { case_sensitive: false }
  validates :status, inclusion: { in: Transaction::STATUS }

  before_validation do
    set_code("TOPUP")
    set_status
  end

  after_create do
    set_history(self.userable, self, "out", self.amount)
  end

  def completed
    wallet = self.userable.wallet

    self.update(status: "completed")
    self.wallet_history.update(status: "completed")
    wallet.update(amount: wallet.amount - self.amount)
  end
end
