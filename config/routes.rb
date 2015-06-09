Rails.application.routes.draw do

  devise_for :bank_accounts

  resources :deposits,                 only: [:new, :create]
  resources :transfers,                only: [:new, :create]
  resources :withdrawals,              only: [:new, :create]
  resources :deactivate_bank_accounts, only: [:update]
  resources :dashboard,                only: [:index]

  devise_scope :bank_account do
    root 'devise/sessions#new'
  end
end
