class Admins::BanksController < AdminController
  private

  def find_query
    @query = Bank.all.order(created_at: :desc)
  end

  def find_object
    @object = Bank.find_by(id: params[:id])
  end

  def find_class
    @class = Bank
  end

  def find_config
    @config = {
      partial: "admins/banks/lists",
      redirect_location: admins_banks_path
    }
  end

  def object_params
    params.require(:bank).permit(:name)
  end
end
