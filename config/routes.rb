Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_application
  end
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :products
      # get 'products/index'
      # get 'products/show'
    end
  end

  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
