CatNews::Application.routes.draw do
  root :to => "posts#index"

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  match '/signout' => 'sessions#destroy'


  resources :comments, :except => [:edit, :update]
  resources :posts, :except => [:edit, :update]
  resources :users
  resources :emails, :except => [:edit, :update]
  #post '/user/add_karma'
end
