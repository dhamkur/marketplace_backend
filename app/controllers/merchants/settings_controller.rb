class Merchants::SettingsController < MerchantController
  skip_before_action :find_query, :find_class, :find_config

  def index;end
end
