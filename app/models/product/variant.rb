# == Schema Information
#
# Table name: product_variants
#
#  id         :bigint           not null, primary key
#  product_id :bigint
#  name       :string
#  amount     :decimal(, )      default(0.0)
#  discount   :decimal(, )      default(0.0)
#  stock      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product::Variant < ApplicationRecord
  STATUS = ["in_stock", "out_of_stock"]

  belongs_to :product
end
