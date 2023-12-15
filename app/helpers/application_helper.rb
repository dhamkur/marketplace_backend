module ApplicationHelper
  include Pagy::Frontend

  def money(amount)
    number_to_currency(amount, precision: 2, unit: "$")
  end
end
