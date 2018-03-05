Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :vehicles do
         get "/most_expensive", to: "most_expensive#index"
         get "/least_mileage", to: "least_mileage#index"
         get "/color", to: "color#index"
         get "/option", to: "option#index"
      end

      resources :makes, except: [:new] do
        resources :models
      end

      resources :options, except: [:new]
      resources :vehicles, except: [:new]


    end
  end

end
