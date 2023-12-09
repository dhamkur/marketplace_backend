# == Schema Information
#
# Table name: campaign_orders
#
#  id             :bigint           not null, primary key
#  campaign_id    :bigint
#  code           :string
#  status         :string
#  sub_total      :decimal(, )      default(0.0)
#  tax_amount     :decimal(, )      default(0.0)
#  tax_id         :bigint
#  payment_method :string
#  total_payment  :decimal(, )      default(0.0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Campaign::Order < ApplicationRecord
  belongs_to :campaign
end
