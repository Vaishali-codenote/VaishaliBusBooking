Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "routes#index"
  get "buses/search"

  resources :routes
  resources :tickets
  resources :transactions, only: [:create]
  resources :buses do
    collection do
      get :city_suggestions
    end
    resources :tickets
  end
  get '/autosuggestion', to: 'buses#autocomplete'
  





   resources :schedules
end