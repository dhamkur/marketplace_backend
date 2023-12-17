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
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Order < ApplicationRecord
  include General

  Transaction::ORDER

  belongs_to :user
  belongs_to :promotion, optional: true
  belongs_to :tax, optional: true

  before_save :set_status
  before_save do set_code("INV") end
end
