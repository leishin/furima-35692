Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  # get 'users/index'
  # resources  :users
  resources :items

end
