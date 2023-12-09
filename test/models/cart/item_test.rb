# == Schema Information
#
# Table name: cart_items
#
#  id           :bigint           not null, primary key
#  cart_id      :bigint
#  product_id   :bigint
#  quantity     :integer          default(0)
#  amount       :decimal(, )      default(0.0)
#  total_amount :decimal(, )      default(0.0)
#  is_selected  :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class Cart::ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
