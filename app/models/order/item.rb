# == Schema Information
#
# Table name: order_items
#
#  id                     :bigint           not null, primary key
#  order_id               :bigint
#  product_id             :bigint
#  quantity               :integer          default(0)
#  amount                 :decimal(, )      default(0.0)
#  delivery_fee           :decimal(, )      default(0.0)
#  total_amount           :decimal(, )      default(0.0)
#  delivery_tracking_code :string
#  status                 :string
#  delivery_method        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  product_variant_id     :bigint
#
class Order::Item < ApplicationRecord
  include General
  include Scopeable

  belongs_to :order
  belongs_to :product
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"

  validates :delivery_method, presence: true, on: :update
  validates :status, inclusion: { in: Transaction::ORDER }

  before_validation :set_status

  scope :by_merchant, -> (merchant_id) {
    joins(:product).where("products.merchant_id = ?", merchant_id).newest
  }
end
