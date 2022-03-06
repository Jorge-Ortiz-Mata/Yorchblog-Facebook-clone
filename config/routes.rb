Rails.application.routes.draw do

  # Posts routes.
  resources :posts, except: [:index]

  # Profile routes.
  resources :profiles, except: [:index, :destroy]

  # Devise users routes.
  devise_for :users

  # Pages controller. 
  root 'pages#home'

end
