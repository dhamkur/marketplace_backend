class Pages::HomesController < ApplicationController
  def index
    @pagy, @objects = pagy(
      Product.where(status: "active"),
      link_extra: "data-turbo-stream='true'",
      items: 12
    )

    render "shared/scrollable_list" if params[:page].present?
  end
end
