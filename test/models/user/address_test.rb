# == Schema Information
#
# Table name: user_addresses
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  label      :string
#  address    :text
#  city       :string
#  state      :string
#  country    :string
#  zip_code   :string
#  is_default :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class User::AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
