Rails.application.routes.draw do



  devise_for :users

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

  resources :users do
    resources :skills, only: [:index, :show]
  end
  delete 'users/:user_id/skills/:id' => 'skills#destroy', :as => 'delete_skill'
  post 'users/:user_id/skills/' => 'skills#create', :as => 'create_skill'

  post 'skills/list' => 'skills#index', :as => 'skills_list'

  root 'static_pages#index'

end
