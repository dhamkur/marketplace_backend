# == Schema Information
#
# Table name: user_addresses
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  label      :string
#  address    :text
#  city       :string
#  state      :string
#  country    :string
#  zip_code   :string
#  is_default :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User::Address < ApplicationRecord
  belongs_to :user

  before_save :validate_multiple_default_address
  before_create :validate_max_limit_address

  validates :label, :receiver, :address, :city, :phone_number,
            :country, :state, :zip_code, presence: true

  def validate_multiple_default_address
    if self.is_default
      User::Address.where(user_id: self.user_id).update_all(is_default: false)
    end
  end

  def validate_max_limit_address
    addresses = User::Address.where(user_id: self.user_id)

    if addresses.size == 3
      errors.add(:base, "You can only add maximum 3 addresses.")
    end
  end
end
