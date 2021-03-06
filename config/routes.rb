Rails.application.routes.draw do

  # Comments routes.
  get 'uncomment', to: 'comments#destroy'
  
  # Likes routes.
  get 'like', to: "likes#create"
  get 'dislike', to: "likes#destroy"

  # Connections routes.
  resources :connections
  get 'add/friend', to: "connections#create"
  get 'remove/friend', to: "connections#destroy"

  # Search routes.
  get 'result', to: 'searches#result'
  get 'search', to: 'searches#search_user'

  # Post routes.
  resources :posts do
    resources :comments, except: [:index]
  end

  # Profile routes.
  resources :profiles, except: [:index, :destroy]

  # Devise users routes.
  devise_for :users

  # Pages controller. 
  root 'pages#home'

end
