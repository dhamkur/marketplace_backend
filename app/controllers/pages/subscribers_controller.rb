class Pages::SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.new(object_params)

    if subscriber.save
      redirect_back(
        fallback_location: root_path,
        notice: "Successfully subscribed to our mailing lists"
      )
    else
      redirect_back(
        fallback_location: root_path,
        alert: "You already subscribed to our mailing lists"
      )
    end
  end

  private

  def object_params
    params.require(:subscriber).permit(:email)
  end
end
