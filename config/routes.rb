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
    resources :users, only: [:show, :edit, :update] do
      resources :post_comments, only: [:show]
    end
    resources :post_recipes, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:index, :destroy]
    end
  end
  scope module: :public do
    get 'search' => 'searches#search'
    get 'ingredient_search/:ingredient_name' => 'searches#ingredient_search',as: 'ingredient_search'
    get 'my_page' => 'users#show'
    delete 'shopping_lists/destroy_all' => 'shopping_lists#destroy_all'
    get 'withdraw' => 'users#withdraw'
    patch 'withdraw_update' => 'users#withdraw_update'
    post 'fridge_create' => 'fridges#fridge_create'
    resources :users, only: [:show, :edit, :update]
    resources :post_recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :ingredints, only: [:create, :update, :destroy]
      resources :making_recipes, only: [:create, :update, :destroy]
      resources :post_comments, only: [:index, :create, :destroy]
    end
    resources :fridges, only: [:index, :create, :update, :destroy]
    resources :shopping_lists, only: [:index, :create, :update, :destroy]
  end
end
