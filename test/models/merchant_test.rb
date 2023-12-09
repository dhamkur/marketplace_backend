# == Schema Information
#
# Table name: merchants
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  merchant_name          :string
#  merchant_address       :text
#  avatar_data            :text
#  pic_name               :string
#  pic_phone_number       :string
#  pic_address            :text
#  instagram              :string
#  tiktok                 :string
#  website                :string
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require "test_helper"

class MerchantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
