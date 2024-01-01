# == Schema Information
#
# Table name: promotions
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  promo_type :string
#  amount     :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Promotion < ApplicationRecord
  TYPE = ["percentage", "normal_amount"]

  def discount(data)
    if promotion_type == "percentage"
      return (data.to_f * amount.to_f) / 100.to_f
    else
      return amount.to_f
    end
  end
end
