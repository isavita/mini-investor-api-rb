Rails.application.routes.draw do
  resources :campaigns, only: [:index, :show]
  resources :investments, only: [:create]
end
