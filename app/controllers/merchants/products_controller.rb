class Merchants::ProductsController < MerchantController
  def index
    @pagy, @objects = pagy(current_merchant.products.active.newest)
  end
end
