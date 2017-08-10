Rails.application.routes.draw do
  get 'home/index'
  get 'home/email_send', as: 'email_send'
  get 'email_verification', to: 'home#email_verification', as: 'email_verification'

  root 'home#guest'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
