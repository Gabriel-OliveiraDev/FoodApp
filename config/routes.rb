Rails.application.routes.draw do
  root "home#index"
  devise_for :admins

  namespace :admin do
    resources :orders
    resources :products do
      resources :stocks
    end
    resources :categories
  end

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end

  resources :categories, only: [:show]
  resources :products, only: [:show]

  get "admin" => "admin#index"
  get "cart" => "cart#show"
end
