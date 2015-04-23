Rails.application.routes.draw do

  resources :ratings
  resources :learning_objectives
  resources :courses
  devise_for :users

  root 'static_pages#index'


end
