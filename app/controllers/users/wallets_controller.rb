class Users::WalletsController < UserController
  before_action :find_object, only: [:show, :update]

  def index
    status  = params[:status].present? ? params[:status] : Transaction::STATUS
    @search = Wallet::History.my_history(
      current_user.wallet.id, status
    ).ransack(params[:q]) # add history_type in here

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

  def show;end

  def update
    url = users_wallets_path

    if @object.update(proof_of_transfer: params[:proof_of_transfer])
      message = "Your file uploaded. Please wait for the verification!"
      redirect_back(fallback_location: url, notice: message)
    else
      message = @object.errors.full_messages
      redirect_back(fallback_location: url, notice: message)
    end
  end

  private

  def find_object
    wallet  = current_user.wallet.id
    @object = Wallet::History.find_by(id: params[:id], wallet_id: wallet)
  end
end
