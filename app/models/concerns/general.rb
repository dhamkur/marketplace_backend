module General
  extend ActiveSupport::Concern

  def set_status
    self.status = "pending"
  end

  def set_code(type = "")
    current_time = Time.now.strftime("%d%m%Y%H%M%S")
    transaction  = "#{type}/#{current_time}"

    self.code = transaction
  end

  def set_history(user, transaction, amount_type)
    if user.present? && transaction.present?
      Wallet::History.create(
        wallet_id: user.wallet.id,
        transactionable_id: transaction.id,
        transactionable_type: transaction.class.name,
        history_type: transaction.class.name.underscore,
        amount: transaction.amount,
        amount_type: amount_type,
        code: transaction.code
      )
    end
  end
end
