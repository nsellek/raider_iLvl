Rails.application.routes.draw do
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
  resources :guilds
  resources :raid_groups
  # raid_groups paths
  get "raid_groups/:id/add_members" => "raid_groups#add_members", as: "group_members"

end
