# == Schema Information
#
# Table name: subscribers
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Subscriber < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
