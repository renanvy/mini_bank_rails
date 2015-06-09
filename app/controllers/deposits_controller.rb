class DepositsController < ApplicationController

  respond_to :html
  
  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.process(deposit_params)

    respond_with(@deposit, location: new_deposit_url)
  end

  private

  def deposit_params
    params.require(:deposit).permit(:account_number, :value)
  end
end