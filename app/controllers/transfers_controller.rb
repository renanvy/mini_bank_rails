class TransfersController < ApplicationController
  before_action :authenticate_bank_account!

  def new
  end

  def create
    Transfer.new(current_bank_account, transfer_params).process
  end

  private

  def deposit_params
    params.require(:transfer_params).permit(:account_number, :value)
  end
end