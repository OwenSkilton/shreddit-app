Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'home/about'
  root 'home#index'
end
