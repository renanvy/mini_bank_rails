class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :verify_if_bank_account_active

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :number) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :name
    )}
  end

  def verify_if_bank_account_active
    if bank_account_signed_in? && !current_bank_account.active?
      sign_out(current_bank_account)
      
      redirect_to root_url, alert: "Essa conta foi encerrada. Entre em contato com o banco para mais detalhes."
    end
  end
end
