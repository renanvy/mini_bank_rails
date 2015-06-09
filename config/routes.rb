Rails.application.routes.draw do

  devise_for :bank_accounts

  root 'pages#home'
end
