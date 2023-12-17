class Users::CartsController < UserController
  before_action :find_object, only: [:update, :destroy]

  def index
    @pagy, @items = pagy(
      current_user.cart.items,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def create
    cart = current_user.cart
    variant = Product::Variant.find_by(id: params[:variant_id])

    if variant.present? && variant.product.present?
      alert = :notice
      message = "Item has been added to cart"
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
      alert = :alert
      message = "Failed add item to cart or variant not selected"
    end

    redirect_back(fallback_location: products_path, alert => message)
  end

  def update
    case params[:type]
    when "selection"
      is_selected = params[:is_selected] == "on" ? true : false

      @object.update(is_selected: is_selected)
    when "quantity"
      @object.update(quantity: params[:quantity])
    end

    simple_stream("update", "summary", "users/carts/summary")
  end

  def destroy
    @object.destroy

    redirect_back(fallback_location: users_carts_path, notice: "Item has been removed")
  end

  private

  def find_object
    @object = Cart::Item.find_by(id: params[:id])
  end
end
