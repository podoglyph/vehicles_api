Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :makes, except: [:new]

      namespace :makes do
        get '/:id/models', to: "models#index"
      end

    end
  end

end
