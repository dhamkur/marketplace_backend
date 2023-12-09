# == Schema Information
#
# Table name: advertisements
#
#  id             :bigint           not null, primary key
#  name           :string
#  page_type      :string
#  starting_price :decimal(, )      default(0.0)
#  is_available   :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class AdvertisementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
