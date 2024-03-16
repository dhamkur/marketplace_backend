class Merchants::WalletsController < MerchantController
  skip_before_action :find_query, :find_class, :find_config
  before_action :find_object, only: [:show, :update]

  def index
    my_type = params[:type].present? ? params[:type] : Wallet::History::TYPE
    status  = params[:status].present? ? params[:status] : Transaction::STATUS
    @search = Wallet::History.my_history(
      current_merchant.try(:wallet).try(:id), status, my_type
    ).ransack(params[:q])

    @pagy, @histories = pagy(
      @search.result,
      link_extra: "data-turbo-frame='tables' data-turbo-stream='true'",
      items: 10
    )
  end

  def new;end

  def create
    top_up = TopUp.new(
      amount: params[:amount],
      userable_id: current_merchant.id,
      userable_type: current_merchant.class.name
    )

    if top_up.save
      message = "Your top up request has been sent"

      redirect_back(fallback_location: merchants_wallets_path, notice: message)
    else
      message = top_up.errors.full_messages.join(", ")

      redirect_back(fallback_location: merchants_wallets_path, alert: message)
    end
  end

  def withdrawal
    withdrawal = Withdrawal.new(
      amount: params[:amount],
      userable_id: current_merchant.id,
      userable_type: current_merchant.class.name,
      bank_name: params[:bank_name],
      account_holder: params[:account_holder],
      account_number: params[:account_number]
    )

    if withdrawal.save
      message = "Your withdrawal request has been sent"

      redirect_back(fallback_location: merchants_wallets_path, notice: message)
    else
      message = withdrawal.errors.full_messages.join(", ")

      redirect_back(fallback_location: merchants_wallets_path, alert: message)
    end
  end

  def show;end

  def update
    url = merchants_wallets_path

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
    wallet  = current_merchant.wallet.id
    @object = Wallet::History.find_by(id: params[:id], wallet_id: wallet)
  end
end
