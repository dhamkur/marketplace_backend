class Admins::WithdrawalsController < AdminController
  skip_before_action :find_query
  skip_before_action :find_config

  def index
    @search = Withdrawal.all.order(created_at: :desc).ransack(params[:q])
    @pagy, @objects = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def update
    if @object.completed
      simple_stream("replace", @object, @object)
    else
      messages = @object.errors.full_messages
      redirect_back(fallback_location: admins_withdrawals_path, alert: messages)
    end
  end

  private

  def find_object
    @object = Withdrawal.find_by(id: params[:id])
  end
end
