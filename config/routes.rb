Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
  # Defines the root path route ("/")
  root "posts#index"
end
