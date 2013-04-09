CatNews::Application.routes.draw do
  root :to => "posts#index"
  resources :comments, :except => [:edit, :update]
  resources :posts, :except => [:edit, :update]
  resources :users
  resources :emails, :except => [:edit, :update]
end
