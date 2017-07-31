Rails.application.routes.draw do
  get 'home/index'
  root 'home#guest'

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
