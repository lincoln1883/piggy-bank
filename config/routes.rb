Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'

  devise_for :users

  resources :categories do
    resources :transactions, only: [:create, :new, :index]
  end
end
