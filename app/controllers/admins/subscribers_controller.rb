class Admins::SubscribersController < AdminController
  private

  def find_query
    @query = Subscriber.all.order(created_at: :desc)
  end

  def find_object
    @object = Subscriber.find_by(id: params[:id])
  end

  def find_class
    @class = Subscriber
  end

  def find_config
    @config = {
      partial: "admins/subscribers/lists",
      redirect_location: admins_subscribers_path
    }
  end

  def object_params
    params.require(:subscriber).permit(:email)
  end
end
