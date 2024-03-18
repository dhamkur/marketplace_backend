class Merchants::CategoriesController < MerchantController
  skip_before_action :find_query, :find_class, :find_config, :find_object

  def index
    categories = Category.where(name: params[:name])

    render json: { data: categories }, status: :ok
  end

  def show
    category = Category.find_by(id: params[:id])

    render json: { data: category }, status: :ok
  end
end
