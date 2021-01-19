Rails.application.routes.draw do
  devise_for :users
  root to: "plans#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plans do
  end
  resources :performances do
  end
end
