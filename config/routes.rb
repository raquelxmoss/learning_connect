Rails.application.routes.draw do

  resources :ratings
  resources :learning_objectives
  resources :courses

  devise_for :users
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'

  resources :users do
  	resources :skills
  end

  root 'static_pages#index'

end
