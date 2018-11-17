Rails.application.routes.draw do
  root 'home#show'

  resources :api, only: [:index]
end
