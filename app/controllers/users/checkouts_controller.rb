class Users::CheckoutsController < UserController
  before_action :find_order, only: [:show, :update]

  def create
    if current_user.cart.items.selected.present?
      my_address = current_user.default_address

      ActiveRecord::Base.transaction do
        order      = Order.create(
          user_id: current_user.id,
          sub_total: current_user.cart.total_amount,
          total_payment: current_user.cart.total_amount,
          city: my_address&.city,
          state: my_address&.state,
          country: my_address&.country,
          zip_code: my_address&.zip_code,
          address: my_address&.address
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
      end
    else
      message = "You haven't select any item"

      redirect_back(fallback_location: users_carts_path, alert: message)
    end
  end

  def show;end

  def update
    case params[:type]
    when "promotion"
      promotion = Promotion.find_by(code: params[:applied_promo])

      if promotion.present?
        discount = promotion.discount(@order.total_payment)

        @order.update_columns(
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
        @order.update_columns(
          promotion_id: nil,
          applied_promo: nil,
          discount: 0,
          total_payment: @order.raw_total_payment
        )

        redirect_back(
          fallback_location: users_checkout_path(@order),
          alert: "Promo code not found"
        )
      end
    when "delivery"
      @order.update_columns(object_params)
    end
  end

  private

  def find_order
    @order = Order.find_by(id: params[:id])
  end

  def object_params
    payload = {
      city: params[:city], state: params[:state], country: params[:country],
      zip_code: params[:zip_code], address: params[:address]
    }

    return payload
  end
end
