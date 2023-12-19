class Users::PaymentsController < UserController
  def create
    order = Order.find_by(id: params[:order_id])

    if order.xendit_invoice_url.blank?
      xendit = Xendit::Invoice.create(invoice_params(order))

      order.update(
        xendit_external_id: xendit["id"],
        xendit_invoice_url: xendit["invoice_url"]
      )
    end

    redirect_to order.xendit_invoice_url, allow_other_host: true
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
