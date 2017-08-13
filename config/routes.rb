Rails.application.routes.draw do
  root 'events#index' 
  
  devise_for :user
  
  resources :events do 
    collection do 
      get :my
    end
  end
  
  namespace :api do
    resources :events
  end 
end
