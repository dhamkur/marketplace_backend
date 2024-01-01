class Users::CheckoutsController < UserController
  before_action :find_order, only: [:show, :update]

  def create
    if current_user.cart.items.selected.present?
      order = Order.create(
        user_id: current_user.id,
        sub_total: current_user.cart.total_amount,
        total_payment: current_user.cart.total_amount
      )

      if order.present?
        current_user.cart.items.selected.each do |item|
          order_item = Order::Item.create(
            order_id: order.id,
            product_id: item.product_id,
            product_variant_id: item.product_variant_id,
            quantity: item.quantity,
            amount: item.amount,
            total_amount: item.total_amount
          )

          item.destroy if order_item.present?
        end

        redirect_to users_checkout_path(order), notice: "Order has been created"
      else
        message = order.errors.full_messages.join(", ")

        redirect_back(fallback_location: users_carts_path, alert: message)
      end
    else
      message = "You haven't select any item"

      redirect_back(fallback_location: users_carts_path, alert: message)
    end
  end

  def show;end

  def update
    promotion = Promotion.find_by(code: params[:applied_promo])

    if promotion.present?
      discount = promotion.discount(@order.total_payment)

      @order.update(
        promotion_id: promotion.id,
        applied_promo: params[:applied_promo],
        discount: discount,
        total_payment: @order.total_amount - discount
      )

      redirect_back(
        fallback_location: users_checkout_path(@order),
        notice: "Promo code has been applied"
      )
    else
      redirect_back(
        fallback_location: users_checkout_path(@order),
        alert: "Promo code not found"
      )
    end
  end

  private

  def find_order
    @order = Order.find_by(id: params[:id])
  end
end
