Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Add a root route if you don't have one...
  # We can use users#new for now, or replace this with the controller and action you want to be the site root:
  root 'users#new'

  # sign up page with form:
  get 'users/new', to: 'users#new', as: :new_user

  # create (post) action for when sign up form is submitted:
  post 'users', to: 'users#create'

  # log in page with form:
  get '/login', to: 'sessions#new'

  # create (post) action for when log in form is submitted:
  post '/login', to: 'sessions#create'

  # delete action to log out:
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  # TO ACCES THE /LOGOUT ROUTE, YOU NEED TO USE:
  # <%= link_to 'Log out', logout_path, method: :delete %>

  # now implement the above routes using the resources method:
  #root 'users#new'
  #resources :users, only: %i[create]
  #get 'users/new', to: 'users#new', as: :new_user
  #resources :sessions, only: %i[new create destroy]
end
