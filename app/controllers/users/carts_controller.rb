class Users::CartsController < UserController
  before_action :find_object, only: [:update, :destroy]

  def index;end

  def create
    cart = current_user.cart
    variant = Product::Variant.find_by(id: params[:variant_id])

    if variant.present? && variant.product.present?
      message = "Success added item to cart"
      quantity = params[:quantity].to_i
      item = Cart::Item.find_by(
        cart_id: cart.id,
        product_variant_id: params[:variant_id],
        product_id: params[:product_id]
      )

      if item.present?
        total_quantity = item.quantity + quantity
        total_amount = total_quantity * item.amount

        item.update(quantity: total_quantity, total_amount: total_amount)
      else
        Cart::Item.create(
          cart_id: cart.id,
          product_id: variant.product.id,
          quantity: quantity,
          amount: variant.amount,
          product_variant_id: params[:variant_id],
          is_selected: true,
          total_amount: quantity * variant.amount
        )
      end
    else
      message = "Failed add item to cart"
    end

    redirect_back(fallback_location: products_path, notice: message)
  end

  def update;end

  def destroy;end

  private

  def find_object
    @object = current_user.cart.items.find_by(id: params[:id])
  end
end
