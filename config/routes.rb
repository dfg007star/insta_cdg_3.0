Rails.application.routes.draw do
  authenticate :user do
    resources :posts, only: [:create, :destroy, :index, :new]
  end
  get 'users/index'
  get 'pages/home'
  get '/contact', to: 'pages#contact'
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  resources :posts do 
    resources :comments
  end
  resources :users do
    member do
    get :following, :followers
    end 
  end
  root to: "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
