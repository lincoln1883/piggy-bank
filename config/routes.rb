Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'categories#index'
  resources :categories do
    resources :transactions
  end
  get "/", to: 'home#index'
end
