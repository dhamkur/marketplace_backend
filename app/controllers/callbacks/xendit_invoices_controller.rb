class Callbacks::XenditInvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    order = Order.find_by(code: params[:external_id])

    if order.present?
      if params[:status] == "PAID"
        status  = 200
        message = "Your payment has been verified"
        order.update(status: "payment_verified", formatted_response: params)
      else
        status  = 400
        message = "Your payment unsuccessfull"
        order.update_column(:formatted_response, params)
      end
    else
      status  = 400
      message = "Order not found"
    end

    render json: { status: status, message: message }, status: :ok
  end
end
