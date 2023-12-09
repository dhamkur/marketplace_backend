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
end
