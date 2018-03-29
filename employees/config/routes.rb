Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # routes users
  resources :users

  # Form search
  get '/users/search', to: 'users#search'

end
