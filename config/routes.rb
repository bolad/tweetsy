Rails.application.routes.draw do
  resources :packs
  root 'home#index'

  get 'auth/:provider/callback', to:'session#create'
  get 'logout', to: 'session#destroy'

  get 'dashboard' => 'dashboard#index'

  get 'auth/failure', to: 'session#failure'
end
