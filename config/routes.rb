Rails.application.routes.draw do
  scope '/api' do
    resources :campaigns, only: [:index, :show]
    resources :investments, only: [:create]
  end
end
