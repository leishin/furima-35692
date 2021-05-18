Rails.application.routes.draw do
  root to: 'items#index'
  get 'users/index'
  devise_for :users
  resources  :users
  resources :items

end
