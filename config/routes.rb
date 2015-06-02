Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :reports, defaults: { format: 'json' }
    end
  end

  get '/privacy', to: 'pages#privacy'
  get '/terms', to: 'pages#terms'
  get '/support', to: 'pages#support'

  resource :subscriptions, only: :create

  root to: 'pages#home'

  resources :reports
end
