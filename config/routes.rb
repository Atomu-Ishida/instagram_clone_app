Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'posts#index'

  resources :users
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :posts, shallow: true do
    resources :comments
  end
  resources :likes, only: %i[create destroy]
end
