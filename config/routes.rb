Rails.application.routes.draw do
  post 'users/signup', to: 'users#signup'
  post 'users/login', to: 'users#login'
  # Defines the root path route ("/")
  root 'video_shareds#index'
  get 'videoshareds', to: 'video_shareds#index'
  post 'videoshareds', to: 'video_shareds#create'
end
