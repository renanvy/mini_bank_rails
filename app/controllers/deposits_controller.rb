class DepositsController < ApplicationController
  
  def new
  end

  def create
    Deposit.new(deposit_params).process
  end

  private

  def deposit_params
    params.require(:deposit).permit(:account_number, :value)
  end
end