Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :foods, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:show, :edit, :update]
    resources :post_recipes, only: [:index, :show, :destroy]
    resources :post_comments, only: [:index, :destroy]
  end
  scope module: :public do
    get '/users/my_page' => 'users#show'
    delete '/shopping_lists/destroy_all' => 'shopping_lists#destroy_all'
    resources :users, only: [:show, :edit, :update]
    resources :post_recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :ingredints, only: [:create, :update, :destroy]
    resources :making_recipes, only: [:create, :update, :destroy]
    resources :post_comments, only: [:index, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :fridges, only: [:index, :create, :update, :destroy]
    resources :shopping_lists, only: [:index, :create, :update, :destroy]
  end
end
