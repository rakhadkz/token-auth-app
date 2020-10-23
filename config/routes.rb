Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  get 'posts', to: 'post#index'
  post 'post', to: 'post#create'
end
