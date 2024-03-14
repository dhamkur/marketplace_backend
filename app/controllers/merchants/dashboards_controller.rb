class Merchants::DashboardsController < MerchantController
  skip_before_action :find_query

  def index;end
end
