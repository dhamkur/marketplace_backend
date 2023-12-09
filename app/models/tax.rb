# == Schema Information
#
# Table name: taxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  tax_type   :string
#  amount     :decimal(, )      default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tax < ApplicationRecord
end
