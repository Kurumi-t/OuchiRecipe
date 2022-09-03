Rails.application.routes.draw do
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'post_comments/index'
  end
  namespace :admin do
    get 'post_recipes/index'
    get 'post_recipes/show'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'foods/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'shopping_lists/index'
  end
  namespace :public do
    get 'post_comments/index'
  end
  namespace :public do
    get 'post_recipes/index'
    get 'post_recipes/new'
    get 'post_recipes/show'
    get 'post_recipes/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

end
