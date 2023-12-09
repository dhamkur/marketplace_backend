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
end
