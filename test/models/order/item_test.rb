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
#  delivery_method        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  product_variant_id     :bigint
#  status                 :string
#
require "test_helper"

class Order::ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
