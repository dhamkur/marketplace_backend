class Users::OrdersController < UserController
  def index
    status  = params[:status].blank? ? Transaction::ORDER : params[:status]
    @search = current_user.orders.by_status(status).ransack(params[:q])
    @pagy, @orders = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end
end
