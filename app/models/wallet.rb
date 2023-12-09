# == Schema Information
#
# Table name: wallets
#
#  id            :bigint           not null, primary key
#  userable_id   :bigint
#  userable_type :string
#  amount        :decimal(, )      default(0.0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Wallet < ApplicationRecord
  belongs_to :userable, polymorphic: true
end
