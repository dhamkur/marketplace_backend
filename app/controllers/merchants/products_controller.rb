class Merchants::ProductsController < MerchantController
  def index
    @pagy, @products = pagy(current_merchant.products.active.newest)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
