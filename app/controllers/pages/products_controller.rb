class Pages::ProductsController < ApplicationController
  def index
    @categories = Category.all.limit(15)
    @search = Product.where(status: "active").ransack(params[:q])
    @pagy, @objects = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 12
    )
  end

  def show
    @object = Product.find_by(slug: params[:id])
  end
end
