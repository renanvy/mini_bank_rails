class Deposit
  
  def initialize(deposit_params)
    @deposit_params  = deposit_params
  end

  def process
    account_credited = BankAccount.find_by(number: @deposit_params[:account_number])

    account_credited.balance += @deposit_params[:value].to_d

    account_credited.save!

    # TODO: Salva na tabela de transação o valor depositado na conta
  end

end