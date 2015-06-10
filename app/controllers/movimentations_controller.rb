class MovimentationsController < ApplicationController
  before_action :authenticate_bank_account!

  def index
    @movimentations = Movimentation.by_bank_account(current_bank_account).order(created_at: :desc)
  end
end