Rails.application.routes.draw do
  
  resources :packs do
    resources :tweets
  end

  root 'packs#index'

  get 'login', to: 'home#index'
   get 'dashboard', to: 'dashboard#index'

  get 'auth/:provider/callback', to:'session#create'
  get 'logout', to: 'session#destroy'
  get 'auth/failure', to: 'session#failure'
end
