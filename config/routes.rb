Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  resources :trails
  resources :pictures
  resources :videos
  resources :stories
  
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/privacy', to: 'static_pages#privacy'
  post 'static_pages/thank_you'


  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
