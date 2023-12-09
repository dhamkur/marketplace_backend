# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  photoable_id   :bigint
#  photoable_type :string
#  image_data     :text
#  is_thumbnail   :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
