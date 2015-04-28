Rails.application.routes.draw do



  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :connections, only: [:create, :show, :new, :destroy] do
    resources :courses do
      resources :learning_objectives, only: [:show, :index, :destroy, :create]
      resources :ratings, only: [:show, :index, :destroy, :create]
    end
    resources :messages
  end

  delete '/connections/:connection_id/messages/:id' => 'messages#destroy', :as => 'delete_message'
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  post '/users/list', to: 'users#index', as: 'users_list'

  resources :users, only:[:index,:list, :show] do
    resources :skills, only: [:index, :show, :destroy]
  end
  post '/users/:user_id/skills/' => 'skills#create', :as => 'create_skill'
  delete 'users/:user_id/skills/:id' => 'skills#destroy', :as => 'delete_skill'
  post 'skills/list' => 'skills#index', :as => 'skills_list'
  root 'static_pages#index'
  get '/map', to: 'static_pages#map'
end
