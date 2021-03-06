Rails.application.routes.draw do
  constraints ->(request) { request.session[:user_id].present? } do
    # ログインしてる時のルートパス
    root 'posts#index'
  end
  # ログインしてない時のルートパス
  root 'user_sessions#new'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[index new create show]
  resources :posts, shallow: true do
    resources :comments
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
