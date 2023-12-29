class Admins::PromotionsController < AdminController
  private

  def find_query
    @query = Promotion.all.order(created_at: :desc)
  end

  def find_object
    @object = Promotion.find_by(id: params[:id])
  end

  def find_class
    @class = Promotion
  end

  def find_config
    @config = {
      partial: "admins/promotions/lists",
      redirect_location: admins_promotions_path
    }
  end

  def object_params
    params.require(:promotion).permit(:code, :name, :promo_type, :amount)
  end
end
