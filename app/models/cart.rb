# == Schema Information
#
# Table name: carts
#
#  id            :bigint           not null, primary key
#  userable_id   :bigint
#  userable_type :string
#  total_product :integer          default(0)
#  total_amount  :decimal(, )      default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Cart < ApplicationRecord
end
