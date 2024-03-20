class Admins::AdvertisementsController < AdminController
  private

  def find_query
    @query = Advertisement.all
  end

  def find_object
    @object = Advertisement.find_by(id: params[:id])
  end

  def find_class
    @class = Advertisement
  end

  def find_config
    @config = {
      partial: "admins/advertisements/lists",
      redirect_location: admins_advertisements_path
    }
  end

  def object_params
    params.require(:advertisement).permit(
      :name, :page_type, :starting_price, :is_available,
      placements_attributes: [
        :id, :_destroy, :name, :amount, :duration, :image, :available_slot
      ]
    )
  end
end
