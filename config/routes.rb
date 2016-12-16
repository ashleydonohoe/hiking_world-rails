Rails.application.routes.draw do
  get 'static_pages/contact'

  get 'static_pages/privacy'

  get 'static_pages/about'

  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
