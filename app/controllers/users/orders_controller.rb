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

  def update;end # in here we will later implement to cancel function and received order

  private

  def find_order
    @order = current_user.orders.find(params[:id])
  end
end
