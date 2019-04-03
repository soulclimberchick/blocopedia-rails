Rails.application.routes.draw do
  resources :wikis
  get 'wikis/show'
  get 'wikis/new'
  get 'wikis/edit'
  get 'welcome/about'
  devise_for :users
  root 'wikis#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
