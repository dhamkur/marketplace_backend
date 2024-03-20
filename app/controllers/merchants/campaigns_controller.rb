class Merchants::CampaignsController < MerchantController
  private

  def find_query
    @query = current_merchant.campaigns
  end

  def find_object
    @object = Campaign.find_by(id: params[:id])
  end

  def find_class
    @class = Campaign
  end

  def object_params
    params.require(:campaign).permit(
      :merchant_id, :advertisement_placement_id, :name,
      :image, :destination_link, :start_date, :end_date, :duration,
      :status
    )
  end
end
