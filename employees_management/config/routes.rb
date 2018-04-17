Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes employees
  resources :employees

  # Routes leave days
  get '/all_leavedays', to: 'employees#all_leavedays'
  post '/all_leavedays', to: 'employees#update_leavedays'
  resources :leavedays

  # Routes projects
  resources :projects

  # Routes ots
  resources :ots

  # Routes members
  resources :members 

  root 'employees#index'

end
