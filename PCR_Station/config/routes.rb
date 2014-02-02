PCRStation::Application.routes.draw do
  root 'articles#index'
  resources :articles
  resources :primers
  resources :users
end
