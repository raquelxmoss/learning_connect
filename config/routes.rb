Rails.application.routes.draw do



  devise_for :users

  resources :connections, only: [:create, :show, :new, :destroy] do
    resources :courses do
      resources :learning_objectives, only: [:show, :index, :destroy, :create]
      resources :ratings, only: [:show, :index, :destroy, :create]
    end
    resources :messages
  end

  # just deleting a message without the connection might be easier
  delete '/connections/:connection_id/messages/:id' => 'messages#destroy', :as => 'delete_message'
  #unecessary, resources :users below will create
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  post '/users/list', to: 'users#index', as: 'users_list'

  resources :users do
    resources :skills, only: [:index, :show, :destroy]
  end

  #why are these needed? Should be able to use the resources route from above
  post '/users/:user_id/skills/' => 'skills#create', :as => 'create_skill'
  delete 'users/:user_id/skills/:id' => 'skills#destroy', :as => 'delete_skill'

  #should be get?
  post 'skills/list' => 'skills#index', :as => 'skills_list'
  root 'static_pages#index'

end
