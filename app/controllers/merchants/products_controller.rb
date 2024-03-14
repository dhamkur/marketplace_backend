class Merchants::ProductsController < MerchantController
  private

  def find_query
    @query = current_merchant.products.newest
  end

  def find_object
    @object = Product.find_by(id: params[:id])
  end

  def find_class
    @class = Product
  end

  def find_config
    @config = {
      partial: "merchants/products/lists",
      redirect_location: merchants_products_path
    }
  end

  def object_params
    params.require(:bank).permit(:name)
  end
end
