Rails.application.routes.draw do

  # Search routes.
  get 'result', to: 'searches#result'
  get 'search', to: 'searches#search_user'

  # Posts routes.
  resources :posts, except: [:index]

  # Profile routes.
  resources :profiles, except: [:index, :destroy]

  # Devise users routes.
  devise_for :users

  # Pages controller. 
  root 'pages#home'

end
