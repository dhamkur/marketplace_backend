# == Schema Information
#
# Table name: wishlists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  product_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class WishlistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
