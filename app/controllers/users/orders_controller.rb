class Users::OrdersController < UserController
  def index
    @pagy, @orders = pagy(
      current_user.orders,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end
end
