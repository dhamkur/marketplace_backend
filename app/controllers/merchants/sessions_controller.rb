class Merchants::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    merchants_dashboards_path
  end
end
