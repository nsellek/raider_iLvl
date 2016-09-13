Rails.application.routes.draw do
  get 'guild/new'

  get 'guild/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#home"
  # signing up paths
  get "signup" => "users#new"
  post 'users' => "users#create"
  # loging in and out paths
  get "login" => "session#new"
  post "login" => "session#create"
  get "logout" => "session#destory"
  # user paths
  get "dashboard" => "users#dashboard"
  # guild paths
  get "new_guild" => 'guild#new'
  post "new_guild" => 'guild#create'
  get "delete_guild" => 'guild#destory'
end
