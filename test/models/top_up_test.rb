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
require "test_helper"

class TopUpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
