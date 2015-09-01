Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'home#index'

  resources :projects, only: [:index, :show, :create, :destroy] do
    resources :tasks, only: [:index, :show, :create, :destroy]
  end

  resources :tasks, only: [:index, :show, :create, :destroy] do
    resources :comments, only: [:index, :create, :destroy]
  end
end
