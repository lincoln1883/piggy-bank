Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories

end
