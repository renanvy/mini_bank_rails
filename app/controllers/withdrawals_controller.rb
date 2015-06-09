class WithdrawalsController < ApplicationController
  before_action :authenticate_bank_account!

  respond_to :html

  def new
    @withdrawal = Withdrawal.new
  end

  def create
    @withdrawal = Withdrawal.process(withdrawal_params)

    respond_with(@withdrawal, location: -> { dashboard_index_url })
  end

  private

  def withdrawal_params
    params.require(:withdrawal).permit(:value, :current_bank_account_id)
  end
end