Bedside::Application.routes.draw do
  get "visits/show"

  get "visits/edit"

  get "visits/new"

  get "visits/create"

  get "visits/update"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  
  resources :users
  resources :pages do
    resources :wishes, :posts, :page_participations, :visits, :comments
  end
end