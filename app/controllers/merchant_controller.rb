class MerchantController < ApplicationController
  before_action :authenticate_merchant!
end
