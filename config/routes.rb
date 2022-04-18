Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"

  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  patch "add_product", to: "products#add_product"
  put "add_product", to: "products#add_product"
  patch "remove_product", to: "products#remove_product"
  put "remove_product", to: "products#remove_product"


  resources :products
  resources :users, except: [:new]

end
