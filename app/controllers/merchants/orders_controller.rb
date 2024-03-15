class Merchants::OrdersController < MerchantController
  private

  def find_query
    @query = Order.by_merchant(current_merchant.id)
  end

  def find_object
    @object = Order.find_by(id: params[:id])
  end
end
