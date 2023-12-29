class AdminController < ApplicationController
  include Crudable

  before_action :authenticate_admin!
end
