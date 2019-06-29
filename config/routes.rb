Rails.application.routes.draw do
  root 'home#index'


  get 'auth/:provider/callback', to:'session#create'
  get 'signout', to: 'session#destroy'

  get 'auth/failure', to: 'session#failure'
end
