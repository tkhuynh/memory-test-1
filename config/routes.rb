Rails.application.routes.draw do
  post 'customer/create', to: "customer#create"
  post 'kid/create', to: "kid#create"
end
