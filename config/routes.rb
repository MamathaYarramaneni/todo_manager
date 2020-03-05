Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :todos
  resources :users
  post "users/:id/login", to: "users#login"
end
