# == Schema Information
#
# Table name: orders
#
#  id                 :bigint           not null, primary key
#  user_id            :bigint
#  promotion_id       :bigint
#  code               :string
#  applied_promo      :string
#  sub_total          :decimal(, )      default(0.0)
#  discount           :decimal(, )      default(0.0)
#  total_payment      :decimal(, )      default(0.0)
#  address            :text
#  city               :string
#  state              :string
#  zip_code           :string
#  country            :string
#  used_wallet        :decimal(, )      default(0.0)
#  status             :string
#  payment_method     :string
#  total_delivery_fee :decimal(, )      default(0.0)
#  tax_amount         :decimal(, )      default(0.0)
#  tax_id             :bigint
#  xendit_invoice_url :string
#  xendit_external_id :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Order < ApplicationRecord
  include General

  belongs_to :user
  belongs_to :promotion, optional: true
  belongs_to :tax, optional: true

  has_many :items, dependent: :destroy

  validates :sub_total, :total_payment, presence: true
  validates :status, inclusion: { in: Transaction::ORDER }

  scope :by_status, -> (data) { where(status: data) }

  before_validation do
    set_code("INV")
    set_status
  end
end
