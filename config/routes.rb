Rails.application.routes.draw do

 
  resources :courses do 
    resources :learning_objectives
    resources :ratings
  end

  devise_for :users
  resources :connections
  resources :messages
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'

  resources :users do
  	resources :skills, only: [:index, :show]
  end
  delete 'users/:user_id/skills/:id' => 'skills#destroy', :as => 'delete_skill'

  root 'static_pages#index'

end
