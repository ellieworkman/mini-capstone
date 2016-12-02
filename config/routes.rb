Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to:"products#index"
  
  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"
  
  get"/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  get "/products/:id", to: "products#show"

  get "/products/:id", to: "products#edit"
  delete "/products/:id", to: "products#destroy"

  get "/products/suppliers", to: "products#suppliers"

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/orders/:id", to: "orders#show"
  post "/carted_products", to: "carted_products#create"

  get "/carted_products", to: "carted_products#index"

  post "/orders", to: "orders#create"

  delete "/carted_products", to: "carted_products#destroy"


 

end
