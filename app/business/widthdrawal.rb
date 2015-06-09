class Withdrawal
  
  def initialize(current_bank_account, withdrawal_params)
    @current_bank_account = current_bank_account
    @withdrawal_params    = withdrawal_params
  end

  def process
    @current_bank_account.balance -= @withdrawal_params[:value].to_d

    @current_bank_account.save!

    # TODO: Salva na tabela de transação o valor retirado da conta
  end

end