class Transfer
  
  def initialize(account_debited, transfer_params)
    @account_debited = account_debited
    @transfer_params = transfer_params
  end

  def process
    account_credited = BankAccount.find_by(number: @transfer_params[:account_number])

    account_credited.balance += @transfer_params[:value].to_d
    @account_debited.balance -= @transfer_params[:value].to_d

    account_credited.save!
    @account_debited.save!

    # TODO: Salva na tabela de transação o valor creditado na conta
    # TODO: Salva na tabela de transação o valor debitado  da conta
  end

end