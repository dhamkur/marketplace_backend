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
    params.require(:product).permit(
      :name, photos_attributes: [
        :id, :_destroy, :photoable_id,
        :photoable_type, :image, :is_thumbnail
      ], variants_attributes: [
        :id, :_destroy, :product_id, :name, :amount,
        :discount, :stock, :status
      ]
    )
  end
end
