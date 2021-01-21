Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plans
  resources :performances
  resources :users, only: :show
end
