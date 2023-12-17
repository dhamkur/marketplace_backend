# == Schema Information
#
# Table name: wishlists
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  product_id :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :product_id, uniqueness: { scope: :user_id }  
end
