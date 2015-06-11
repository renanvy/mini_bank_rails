class DepositsController < ApplicationController
  before_action :authenticate_bank_account!
  
  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.process(deposit_params)

    respond_with(@deposit, location: dashboard_index_url)
  end

  private

  def deposit_params
    params.require(:deposit).permit(:account_number, :value, :current_bank_account_id)
  end
end