Rails.application.routes.draw do
  resources :events
  #devise_for :users
  #get 'person/profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
 # get 'persons/profile', as: 'user_root'
end
