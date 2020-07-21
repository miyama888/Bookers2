Rails.application.routes.draw do
  devise_for :users

  root "users#top"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:index, :edit, :update, :show] 
resources :books, only: [:create, :index, :show, :edit, :destroy]
end
