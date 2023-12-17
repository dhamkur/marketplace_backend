class Users::WalletsController < UserController
  def index
    type = Wallet::History::TYPE
    type = params[:type] if params[:type].present?

    @pagy, @histories = pagy(
      Wallet::History.my_history(current_user.wallet.id, type),
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def create
    top_up = TopUp.create(
      amount: params[:amount],
      userable_id: current_user.id,
      userable_type: current_user.class.name
    )
  end
end
