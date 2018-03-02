Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :makes, except: [:new]

      namespace :makes do
        get "/:id/models", to: "models#index"
        post "/:id/models", to: "models#create"
      end

    end
  end

end
