class WithdrawalsController < ApplicationController
  before_action :authenticate_bank_account!

  def new
  end

  def create
    Withdrawal.new(current_bank_account, withdrawal_params).process
  end

  private

  def withdrawal_params
    params.require(:withdrawal_params).permit(:value)
  end
end