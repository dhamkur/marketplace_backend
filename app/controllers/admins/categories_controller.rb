class Admins::CategoriesController < AdminController
  private

  def find_query
    @query = Category.all.order(created_at: :desc)
  end

  def find_object
    @object = Category.find_by(id: params[:id])
  end

  def find_class
    @class = Category
  end

  def find_config
    @config = {
      partial: "admins/categories/lists",
      redirect_location: admins_categories_path
    }
  end

  def object_params
    params.require(:category).permit(:name)
  end
end
