class DeactivateBankAccountsController < ApplicationController
  before_action :authenticate_bank_account!

  def update
    current_bank_account.update(active: false)
    sign_out(current_bank_account)

    redirect_to root_url, notice: "Conta encerrada com sucesso."
  end
end