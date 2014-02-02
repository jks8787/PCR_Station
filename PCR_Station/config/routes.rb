PCRStation::Application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :users
  resources :articles
  resources :primers
end
