class TransfersController < ApplicationController
  before_action :authenticate_bank_account!

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.process(transfer_params)

    respond_with(@transfer, location: dashboard_index_url)
  end

  private

  def transfer_params
    params.require(:transfer).permit(:account_number, :value, :account_debited_id)
  end
end