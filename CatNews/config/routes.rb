CatNews::Application.routes.draw do
  root :to => "posts#index"

  get '/signin' => 'sessions#new' #REV: good, dont want to do this with a match.
  post '/signin' => 'sessions#create'
  match '/signout' => 'sessions#destroy'


  resources :comments, :except => [:edit, :update]
  resources :posts, :except => [:edit, :update] #REV: perhaps it makes sense to nest comments under posts?
  resources :users
  resources :emails, :except => [:edit, :update]
  #post '/user/add_karma'
end
