Rails.application.routes.draw do
  devise_for :users

  root "users#top"
  get "search" => "search#search"
  get "home/about" => "users#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:index, :edit, :update, :show, :new] do
	member do
		get :followings, :followers
	end

end

resources :relationships, only: [:create, :destroy]
resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
 resource :favorites, only: [:create, :destroy]
 resources :book_comments, only: [:create, :destroy]
end
end
