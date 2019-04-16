Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrade, only: [:new, :create]
  post 'downgrade/create'
  get 'wikis/show'
  get 'wikis/new'
  get 'wikis/edit'
  get 'welcome/about'
<<<<<<< HEAD


  devise_for :users
  delete 'charges/downgrade'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
=======
  devise_for :users
  root 'wikis#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> user-story-8-markdown
end
