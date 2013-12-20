RedditClone::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resources :subs
  resources :links do
    resources :comments, :only => [:create, :destroy]
  end

  get "/", :to => 'subs#index'
end
