Rails.application.routes.draw do

  devise_for :bank_accounts

  resources :deposits,                 only: [:new, :create]
  resources :transfers,                only: [:new, :create]
  resources :withdrawals,              only: [:new, :create]
  
  resources :deactivate_bank_accounts, only: [:update]

  root 'pages#home'
end
