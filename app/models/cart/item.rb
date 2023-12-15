# == Schema Information
#
# Table name: cart_items
#
#  id                 :bigint           not null, primary key
#  cart_id            :bigint
#  product_id         :bigint
#  quantity           :integer          default(0)
#  amount             :decimal(, )      default(0.0)
#  total_amount       :decimal(, )      default(0.0)
#  is_selected        :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  product_variant_id :bigint
#
class Cart::Item < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :variant, class_name: "Product::Variant", foreign_key: "product_variant_id"

  scope :selected, -> { where(is_selected: true) }

  after_save :recalculate_total_amount_and_total_product

  def recalculate_total_amount_and_total_product
    all_products = cart.items.selected.sum(:product_id)
    all_amounts  = cart.items.selected.sum(:total_amount)

    self.cart.update(total_amount: all_amounts, total_product: all_products)
  end
end
