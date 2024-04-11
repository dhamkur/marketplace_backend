class Users::PaymentsController < UserController
  def create
    order = Order.find_by(id: params[:order_id])

    case params[:payment_method]
    when "e-wallet"
      wallet = current_user.wallet

      if wallet.amount >= order.total_payment
        used_wallet = wallet.amount - order.total_payment

        order.update(
          payment_method: "e-wallet",
          status: "payment_verified",
          used_wallet: used_wallet
        )
        wallet.update(amount: used_wallet)

        redirect_to users_orders_path, notice: "Your payment has been verified"
      else
        redirect_back(
          fallback_location: users_checkout_path(order),
          alert: "Your wallet amount insufficient"
        )
      end
    when "online-payment"
      if order.xendit_invoice_url.blank?
        xendit = Xendit::Invoice.create(invoice_params(order))

        order.update(
          payment_method: "online-payment",
          xendit_external_id: xendit["id"],
          xendit_invoice_url: xendit["invoice_url"]
        )
      end

      redirect_to order.xendit_invoice_url, allow_other_host: true
    else
      redirect_back(
        fallback_location: users_checkout_path(order),
        alert: "Payment method must be selected"
      )
    end
  end

  private

  def invoice_params(order)
    return {
      external_id: order.code,
      payer_email: order.user.email,
      description: "Payment Order: #{order.code}",
      amount: order.total_payment.to_f,
      currency: "IDR"
    }
  end
end
