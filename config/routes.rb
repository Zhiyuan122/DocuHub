Rails.application.routes.draw do
  # Root route
  root 'pages#home'

  # API routes
  namespace :api do
    resources :documents, only: [:create, :show] do
      member do
        get :track
      end
    end

    namespace :admin do
      post 'login', to: 'sessions#create'
      resources :documents, only: [:index] do
        member do
          put :update_status
        end
      end
    end
  end

  # Admin pages
  get '/admin', to: 'admin#dashboard'
  get '/admin/login', to: 'admin#login'

  # Document tracking
  get '/track/:tracking_code', to: 'documents#track', as: :track_document

  # Catch all for SPA routing
  get '*path', to: 'pages#home'
end 