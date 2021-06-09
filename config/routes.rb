Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  # get 'users/index'
  # resources  :users
  resources :items do
    resources :purchase_records
  end
end
