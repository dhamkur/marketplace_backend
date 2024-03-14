class MerchantController < ApplicationController
  before_action :authenticate_merchant!

  private

  def is_approved_merchant?
    redirect_back(
      fallback_location: root_path,
      alert: "Your account status hasn't approved yet"
    ) if merchant_signed_in? && current_merchant.status != "approved"
  end
end
