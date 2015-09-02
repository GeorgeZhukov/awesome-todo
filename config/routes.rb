Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  root 'home#index'


  resources :projects do
    resources :tasks, shallow: true do
      resources :comments, shallow: true do
        resources :attached_files, shallow: true
      end
    end
  end
  # resources :projects, only: [:index, :show, :create, :destroy] do
  #   resources :tasks, only: [:index, :show]
  # end
  #
  # resources :tasks do
  #   resources :comments, only: [:index]
  # end
  #
  # resources :comments do
  #   resources :attached_files, only: [:index]
  # end
end
