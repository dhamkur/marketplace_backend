class Users::OrdersController < UserController
  before_action :find_order, only: [:show, :update]

  def index
    status  = params[:status].blank? ? Transaction::ORDER : params[:status]
    @search = current_user.orders.by_status(status).ransack(params[:q])
    @pagy, @orders = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def show;end

   # in here we will later implement to cancel function and received order
  def update
    case params[:type]
    when "cancel"
      @order.update(status: "canceled")

      respond_to do |format|
        format.html
        format.turbo_stream do
          redirect_back(fallback_location: users_orders_path)
        end
      end
    when "completed"
      @order.update(status: "completed")
      @order.items.each do |item|
        wallet   = merchant.wallet
        merchant = item.product.merchant

        wallet.update(amount: wallet.amount + item.total_amount)
      end
    else
      redirect_back(
        fallback_location: users_orders_path,
        alert: "You are not allowed to delete the type"
      )
    end
  end

  private

  def find_order
    @order = current_user.orders.find(params[:id])
  end
end
