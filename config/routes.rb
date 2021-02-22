Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'users/registrations', :confirmations => 'users/confirmations', 
                                       :passwords => 'users/passwords', :sessions => 'users/sessions',:unlocks => 'users/unlocks'}
  resources :posts
  get 'home/about'
  root 'home#index'
end
