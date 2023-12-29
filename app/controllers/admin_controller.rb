class AdminController < ActionController::Base
  include Pagy::Backend
  include Responder
  include Crudable

  layout "application"

  before_action :authenticate_admin!
end
