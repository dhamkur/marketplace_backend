# == Schema Information
#
# Table name: top_ups
#
#  id               :bigint           not null, primary key
#  code             :string
#  amount           :decimal(, )      default(0.0)
#  status           :string
#  userable_id      :bigint
#  userable_type    :string
#  proof_of_payment :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class TopUp < ApplicationRecord
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
    set_history(self.userable, self, "in", self.amount)
  end

  def completed
    wallet = self.userable.wallet

    self.update(status: "completed")
    self.wallet_history.update(status: "completed")
    wallet.update(amount: wallet.amount + self.amount)
  end
end
