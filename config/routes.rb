Rails.application.routes.draw do

  devise_for :bank_accounts

  resources :deposits,        only: [:new, :create]
  resources :transfers,       only: [:new, :create]
  resources :withdrawals,     only: [:new, :create]

  root 'pages#home'
end
