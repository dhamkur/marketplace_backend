# == Schema Information
#
# Table name: top_ups
#
#  id            :bigint           not null, primary key
#  code          :string
#  amount        :decimal(, )      default(0.0)
#  status        :string
#  userable_id   :bigint
#  userable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class TopUp < ApplicationRecord
  include General
  
  validates :code, uniqueness: { case_sensitive: false }
  validates :status, inclusion: { in: Transaction::STATUS }

  before_save :set_status

  after_create do
    set_code("TOPUP")
    set_history(self.userable, self, "in")
  end
end
