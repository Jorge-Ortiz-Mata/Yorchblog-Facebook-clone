Rails.application.routes.draw do

  # Profiles routes.
  resources :profiles, except: [:index]

  # Devise users routes.
  devise_for :users

  # Pages controller. 
  root 'pages#home'

end
