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
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord
  STATUS = ["active", "inactive"]

  belongs_to :merchant
  belongs_to :category

  has_many :variants, class_name: "Product::Variant"
  has_many :photos, foreign_key: "photoable_id"

  before_save :set_slug

  def set_slug
    self.slug = self.name.gsub(" ", "-").downcase if self.name.present?
  end
end
