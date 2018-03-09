Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(create new show index)
  resource :session, only: %i(create destroy new)
  resources :bands
  resources :albums, only: %i(destroy update show edit new create)
end
