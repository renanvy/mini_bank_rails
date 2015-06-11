class ExtractsController < ApplicationController
  before_action :authenticate_bank_account!

  def new
    @extract = Extract.new
  end

  def index

    redirect_to new_extract_path, alert: "Selecione as datas" if dates_blank?

    extract = Extract.new(params[:extract])

    @movimentations = Movimentation.by_period(
      extract.start_date, 
      extract.end_date, 
      current_bank_account
    ).order(created_at: :desc)
  end

  private

  def dates_blank?
    params[:extract][:start_date].blank? || params[:extract][:end_date].blank?
  end
end