Rails.application.routes.draw do

 

  devise_for :users
  
  resources :connections do 
    resources :courses do 
      resources :learning_objectives, only: [:show, :index, :destroy, :create]
      resources :ratings, only: [:show, :index, :destroy, :create]
    end
    resources :messages
  end


  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'

  resources :users do
  	resources :skills, only: [:index, :show]
  end
  delete 'users/:user_id/skills/:id' => 'skills#destroy', :as => 'delete_skill'
  post 'users/:user_id/skills/' => 'skills#create', :as => 'create_skill'

  root 'static_pages#index'

end
