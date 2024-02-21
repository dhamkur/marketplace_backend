class Users::SettingsController < UserController
  before_action :find_object, only: [:edit, :update, :destroy]

  def index;end

  def create
    case params[:type]
    when "bank"
      if current_user.user_bank.blank?
        bank = User::Bank.new(bank_params)

        if bank.save
          messages = "Your bank account has been added"
          redirect_back(fallback_location: users_settings_path, notice: messages)
        else
          messages = bank.errors.full_messages
          redirect_back(fallback_location: users_settings_path, alert: messages)
        end
      end
    when "address"
      if current_user.addresses.size < 3
        address = User::Address.new(address_params)

        if address.save
          messages = "Your new address has been added"
          redirect_back(fallback_location: users_settings_path, notice: messages)
        else
          messages = address.errors.full_messages
          redirect_back(fallback_location: users_settings_path, alert: messages)
        end
      else
        messages = "You have reached maximum limit to add new address"
        redirect_back(fallback_location: users_settings_path, alert: messages)
      end
    end
  end

  def edit;end

  def update
    if params[:type] == "bank"
      if @object.update(bank_params)
        messages = "Your bank account has been updated"
        redirect_back(fallback_location: users_settings_path, notice: messages)
      else
        messages = @object.errors.full_messages
        redirect_back(fallback_location: users_settings_path, alert: messages)
      end
    else
      if @object.update(address_params)
        messages = "Your new address has been updated"
        redirect_back(fallback_location: users_settings_path, notice: messages)
      else
        messages = @object.errors.full_messages
        redirect_back(fallback_location: users_settings_path, alert: messages)
      end
    end
  end

  def destroy
    if params[:type] == "address"
      messages = "Your address has been deleted"

      @object.destroy
      redirect_back(fallback_location: users_settings_path, notice: messages)
    end
  end

  private

  def find_object
    user_id = current_user.id

    if params[:type] == "bank"
      @object = User::Bank.find_by(id: params[:id], user_id: user_id)
    else
      @object = User::Address.find_by(id: params[:id], user_id: user_id)
    end
  end

  def bank_params
    params.require(:user_bank).permit(
      :bank_id, :account_holder, :account_number
    ).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:user_address).permit(
      :label, :address, :city, :state,
      :country, :zip_code, :is_default,
      :receiver, :phone_number
    ).merge(user_id: current_user.id)
  end
end
