Rails.application.routes.draw do
  authenticate :user do
    resources :posts, only: %i[create destroy index new edit]
  end
  get 'users/index'
  get 'pages/home'
  get '/contact', to: 'pages#contact'
  devise_for :users

  resources :feed_posts, only: [:index]
  resources :users do
    resources :posts
  end
  resources :relationships, only: %i[create destroy]
  resources :posts do
    resources :comments
  end
  resources :posts do
    resources :likes
  end
  resources :users do
    member { get :following, :followers }
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
