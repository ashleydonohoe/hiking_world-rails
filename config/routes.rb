Rails.application.routes.draw do
  resources :trails
  resources :pictures
  resources :videos
  resources :stories
  # resources :users
  
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'

  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
