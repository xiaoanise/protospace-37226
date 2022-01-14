Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :prototypes, only: [:index, :new, :create, :destroy, :edit, :update, :show]
  resources :users, only: [:edit, :update, :show]

  resources :prototypes do
    resources :comments, only: [:create, :show]
  end
  
end
