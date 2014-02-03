PCRStation::Application.routes.draw do
  root 'articles#index'
  devise_for :users
  resources :users
  resources :articles
  resources :primers
end
