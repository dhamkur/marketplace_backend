# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  merchant_id    :bigint
#  category_id    :bigint
#  name           :string
#  description    :text
#  starting_price :decimal(, )      default(0.0)
#  slug           :string
#  delivery_fee   :decimal(, )      default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord
  belongs_to :merchant
  belongs_to :category
end
