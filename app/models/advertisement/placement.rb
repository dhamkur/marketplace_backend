# == Schema Information
#
# Table name: advertisement_placements
#
#  id               :bigint           not null, primary key
#  advertisement_id :bigint
#  name             :string
#  amount           :decimal(, )      default(0.0)
#  duration         :string
#  image_data       :text
#  available_slot   :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Advertisement::Placement < ApplicationRecord
  belongs_to :advertisement

  include ImageUploader::Attachment(:image)
end
