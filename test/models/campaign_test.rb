# == Schema Information
#
# Table name: campaigns
#
#  id                         :bigint           not null, primary key
#  merchant_id                :bigint
#  advertisement_placement_id :bigint
#  name                       :string
#  image_data                 :text
#  destination_link           :string
#  start_date                 :datetime
#  end_date                   :datetime
#  duration                   :string
#  status                     :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
