Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :makes, except: [:new] do
        resources :models
      end
    end
  end
  
end
