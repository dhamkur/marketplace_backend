# == Schema Information
#
# Table name: promotions
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  promo_type :string
#  amount     :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
