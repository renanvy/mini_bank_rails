class BalancesController < ApplicationController
  before_action :authenticate_bank_account!

  def index
  end
end