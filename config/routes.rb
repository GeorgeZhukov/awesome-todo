Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root 'home#index'

  scope :api do
    scope :v1 do
      resources :projects, except: [:new, :edit] do
        resources :tasks, except: [:new, :edit], shallow: true do
          resources :comments, except: [:new, :edit], shallow: true do
            resources :attached_files, except: [:new, :edit], shallow: true
          end
        end
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
