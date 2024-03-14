class Merchants::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    keys = [:pic_name, :pic_phone_number, :merchant_name]

    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  def after_sign_up_path_for(resource)
    merchants_dashboards_path
  end
end
