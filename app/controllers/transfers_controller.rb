class TransfersController < ApplicationController
  before_action :authenticate_bank_account!

  respond_to :html

  def new
    @transfer = Transfer.new
  end

  def create
    @transfer = Transfer.process(transfer_params)

    respond_with(@transfer, location: new_transfer_url)
  end

  private

  def transfer_params
    params.require(:transfer).permit(:account_number, :value, :account_debited_id)
  end
end