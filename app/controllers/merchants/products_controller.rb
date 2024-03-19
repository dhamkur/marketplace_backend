class Merchants::ProductsController < MerchantController
  def create
    @object = @class.new(object_params)

    if @object.save
      simple_stream("prepend", "lists", @object)
    else
      redirect_back(
        fallback_location: @config[:redirect_location],
        alert: @object.errors.full_messages
      )
    end
  end

  def update
    if @object.update(object_params)
      simple_stream("replace", @object, @object)
    else
      redirect_back(
        fallback_location: @config[:redirect_location],
        alert: @object.errors.full_messages
      )
    end
  end

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
      :name, :description, :starting_price, :delivery_fee,
      :category_id, :status, photos_attributes: [
        :id, :_destroy, :image, :is_thumbnail
      ], variants_attributes: [
        :id, :_destroy, :name, :amount,
        :discount, :stock, :status
      ]
    )
  end
end
