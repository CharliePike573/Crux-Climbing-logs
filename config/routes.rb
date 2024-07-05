Rails.application.routes.draw do
  root "home#index"
  get "climbs/:id", to: "climbs#show", as: :climb, constraints: { id: /\d+/ }
  get "climbs/:climb_type", to: "climbs#new", as: :new_climb
  resources :climbs, except:[:new]
  resources :grade_categories, only: [:index] do
    resources :grades, on: :collection
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end
