Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products", to: "product#index"
  get "/product/detail", to: "product#show"
  post "/product", to: "product#create"
  delete "/product/delete", to: "product#destroy"

end
