Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :home, only: [:index]
  resources :users
  resources :companies do
    resources :lessons
    resources :clients
  end
end
