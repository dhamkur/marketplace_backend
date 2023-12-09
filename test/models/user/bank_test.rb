# == Schema Information
#
# Table name: user_banks
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  bank_id        :bigint
#  account_holder :string
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class User::BankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
