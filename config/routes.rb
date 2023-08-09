Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "routes#index"
  get "buses/search"
  get"buses/all_buses"
  resources :routes do
    resources :buses
  end    
   resources :schedules
end