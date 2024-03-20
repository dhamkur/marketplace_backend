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
class Advertisement < ApplicationRecord
  TYPE = ["home_page", "product_page", "cart_page", "checkout_page"]

  has_many :placements, class_name: "Advertisement::Placement", foreign_key: "advertisement_id", dependent: :destroy

  accepts_nested_attributes_for :placements, reject_if: :all_blank, allow_destroy: true
end
