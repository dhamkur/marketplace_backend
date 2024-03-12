class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Responder
end
