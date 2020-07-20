Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  get 'users/index'
  root "users#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books, only: [:new, :create, :index, :show]
resources :users, only: [:index, :edit, :new, :update, :show]
end
