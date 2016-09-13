Rails.application.routes.draw do
  get 'session/new'

  get 'session/create'

  get 'session/destory'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "signup" => "users#new"
  post 'users' => "users#create"

  get "login" => "session#new"
  post "login" => "session#create"
  get "logout" => "session#destory"
end
