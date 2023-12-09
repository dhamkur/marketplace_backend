# == Schema Information
#
# Table name: product_variants
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  name       :string
#  amount     :decimal(, )      default(0.0)
#  discount   :decimal(, )      default(0.0)
#  stock      :integer          default(0)
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class Product::VariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
