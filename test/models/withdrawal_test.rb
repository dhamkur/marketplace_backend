# == Schema Information
#
# Table name: withdrawals
#
#  id             :bigint           not null, primary key
#  userable_id    :bigint
#  userable_type  :string
#  bank_name      :string
#  account_holder :string
#  account_number :string
#  amount         :decimal(, )      default(0.0)
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class WithdrawalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
