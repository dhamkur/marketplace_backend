module ApplicationHelper
  include Pagy::Frontend

  def money(amount)
    number_to_currency(amount, precision: 2, delimiter: ".", separator: ",", unit: "Rp ")
  end

  def condition(check, value)
    check ? value : ""
  end

  def menu_condition(check, value_1, value_2 = "")
    params[:controller].include?(check) ? value_1 : value_2
  end

  def is_on_wishlist(product_id)
    wishlist = Wishlist.find_by(
      user_id: current_user.id,
      product_id: product_id
    )

    return wishlist.present? ? (wishlist.product_id == product_id) : nil
  end

  def date_time(date)
    date.strftime("%d %B %Y, %H:%M:%S")
  end
end
