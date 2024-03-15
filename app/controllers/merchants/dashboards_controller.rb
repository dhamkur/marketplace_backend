class Merchants::DashboardsController < MerchantController
  skip_before_action :find_query

  def index
    @orders = Order.by_merchant(current_merchant.id)
  end
end
