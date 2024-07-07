class Admins::TopUpsController < AdminController
  skip_before_action :find_query
  skip_before_action :find_config

  def index
    @search = TopUp.all.order(created_at: :desc).ransack(params[:q])
    @pagy, @objects = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def update
    if @object.action_status(params[:status])
      simple_stream("replace", @object, @object)
    else
      messages = @object.errors.full_messages
      redirect_back(fallback_location: admins_top_ups_path, alert: messages)
    end
  end

  private

  def find_object
    @object = TopUp.find_by(id: params[:id])
  end
end
