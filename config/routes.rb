Rails.application.routes.draw do
  get 'pages/index'
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    post 'likes', to: 'tweets#likes'
    post 'retweet', to: 'tweets#retweet', as: 'retweets'
  end

  resources :retweets
  resources :likes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
