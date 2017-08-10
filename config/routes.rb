Rails.application.routes.draw do
  namespace :api do
    resources :events
  end

  resources :events
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'events#index'
devise_for :user
end
