class Users::WishlistsController < UserController
  def index
    @pagy, @wishlists = pagy(
      current_user.wishlists,
      link_extra: "data-turbo-frame='tables' turbo-stream='true'",
      items: 12
    )
  end

  def create
    wishlist = Wishlist.create(
      user_id: current_user.id,
      product_id: params[:product_id]
    )

    redirect_back(fallback_location: users_wishlists_path)
  end

  def destroy
    object  = Wishlist.find_by(
      user_id: current_user.id,
      product_id: params[:id]
    )

    object.destroy

    redirect_back(fallback_location: users_wishlists_path)
  end
end
