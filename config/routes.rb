Rails.application.routes.draw do
  post 'customer/create', to: "customer#create"
end
