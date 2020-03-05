Rails.application.routes.draw do

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]
  post 'downgrade/create'
  get 'wikis/show'
  get 'wikis/new'
  get 'wikis/edit'
  get 'welcome/about'


  devise_for :users
  delete 'charges/downgrade'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
