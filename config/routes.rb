Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :tasks, only: [:index, :create]

  resources :user_token, only: [:create]
end
