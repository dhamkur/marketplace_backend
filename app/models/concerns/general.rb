module General
  extend ActiveSupport::Concern

  def set_status
    self.status = "pending" if self.status.blank?
  end

  def set_code(type = "")
    if self.code.blank?
      current_time = Time.now.strftime("%d%m%Y%H%M%S")
      transaction  = "#{type}/#{current_time}"

      self.code = transaction
    end
  end

  def set_history(user, transaction, amount_type, amount, status="")
    if user.present? && transaction.present?
      Wallet::History.create(
        wallet_id: user.wallet.id,
        transactionable_id: transaction.id,
        transactionable_type: transaction.class.name,
        history_type: transaction.class.name.underscore,
        amount: amount,
        amount_type: amount_type,
        code: transaction.code,
        status: status
      )
    end
  end

  def set_cart
    Cart.create(
      userable_id: self.id,
      userable_type: self.class.name
    ) if self.cart.blank?
  end

  def set_wallet
    Wallet.create(
      userable_id: self.id,
      userable_type: self.class.name
    ) if self.wallet.blank?
  end

  def set_bank
    User::Bank.create(user_id: self.id) if self.user_bank.blank?
  end

  def default_address
    address = User::Address.find_by(is_default: true, user_id: self.id)

    return address
  end
end
