Rails.application.routes.draw do

  # Connections routes
  resources :connections
  get 'add/friend', to: "connections#create"
  get 'remove/friend', to: "connections#destroy"

  # Search routes.
  get 'result', to: 'searches#result'
  get 'search', to: 'searches#search_user'

  # Post routes.
  resources :posts

  # Profile routes.
  resources :profiles, except: [:index, :destroy]

  # Devise users routes.
  devise_for :users

  # Pages controller. 
  root 'pages#home'

end
