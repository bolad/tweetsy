Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'

  mount Sidekiq::Web => '/sidekiq'

  root 'packs#index'

  resources :packs do
    resources :tweets
  end

  get 'login', to: 'home#index'

  get 'auth/:provider/callback', to: 'session#create'
  get 'logout', to: 'session#destroy'
  get 'auth/failure', to: 'session#failure'
end
