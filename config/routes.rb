Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  patch "add_product", to: "users#add_product"
  put "add_product", to: "users#add_product"
  patch "remove_product", to: "users#remove_product"
  put "remove_product", to: "users#remove_product"


  resources :products
  resources :users, except: [:new]

end
