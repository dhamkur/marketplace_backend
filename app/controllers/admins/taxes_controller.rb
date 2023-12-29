class Admins::TaxesController < AdminController
  private

  def find_query
    @query = Tax.all.order(created_at: :desc)
  end

  def find_object
    @object = Tax.find_by(id: params[:id])
  end

  def find_class
    @class = Tax
  end

  def find_config
    @config = {
      partial: "admins/taxes/lists",
      redirect_location: admins_taxes_path
    }
  end

  def object_params
    params.require(:tax).permit(:name, :tax_type, :amount)
  end
end
