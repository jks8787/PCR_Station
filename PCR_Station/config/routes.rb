PCRStation::Application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles
  resources :primers
  resources :users
end
