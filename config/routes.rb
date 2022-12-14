Rails.application.routes.draw do

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations}
  end 



  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new, :destroy] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
    end
  end

  get '/api/users/:user_id/posts', to: 'api#user_posts', as: 'api_user_posts'
  get '/api/users/:user_id/posts/:post_id/comments', to: 'api#user_post_comments', as: 'api_posts_comments'
  post '/api/users/:user_id/posts/:post_id/comments', to: 'api#new_comment', as: 'new_post_comment'
 

end
