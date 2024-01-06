class Callbacks::XenditInvoicesController < ApplicationController
  def create
    order = Order.find_by(code: params[:external_id])

    if order.present?
      if params[:status] == "PAID"
        notice  = :notice
        message = "Your payment has been verified"
        order.update(status: "payment_verified", formatted_response: params)
      else
        notice  = :alert
        message = "Your payment unsuccessfull"
        order.update_column(:formatted_response, params)
      end

      sign_in(order.user)
    else
      notice  = :alert
      message = "Order not found"
    end

    redirect_to users_orders_url, notice => message
  end
end
