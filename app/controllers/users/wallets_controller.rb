class Users::WalletsController < UserController
  def index
    status  = params[:status].present? ? params[:status] : Transaction::STATUS
    @search = Wallet::History.my_history(
      current_user.wallet.id, status
    ).ransack(params[:q])

    @pagy, @histories = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def create
    top_up = TopUp.new(
      amount: params[:amount],
      userable_id: current_user.id,
      userable_type: current_user.class.name
    )

    if top_up.save
      message = "Your top up request has been sent"

      redirect_back(fallback_location: users_wallets_path, notice: message)
    else
      message = top_up.errors.full_messages.join(", ")

      redirect_back(fallback_location: users_wallets_path, alert: message)
    end
  end
end
