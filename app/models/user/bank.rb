# == Schema Information
#
# Table name: user_banks
#
#  id             :bigint           not null, primary key
#  user_id        :bigint
#  bank_id        :bigint
#  account_holder :string
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class User::Bank < ApplicationRecord
  belongs_to :user
  belongs_to :bank, class_name: "::Bank", optional: true
end
