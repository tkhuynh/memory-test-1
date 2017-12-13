Rails.application.routes.draw do
  post 'customer/create', to: "customer#create"
  post 'kid/create', to: "kid#create"
  post 'continuously', to: "kid#continuously"
  post 'continuously_no_pools', to: "kid#continuously_no_pools"

  post '/smstesting', to: "smstesting#dummy"
end
