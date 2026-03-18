Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Add a root route if you don't have one...
  # We can use users#new for now, or replace this with the controller and action you want to be the site root:
  root 'pages#home'

  # sign up page with form:
  get 'register', to: 'users#new', as: :new_user

  # create (post) action for when sign up form is submitted:
  post 'users/', to: 'users#create'

  # show profile page for a user:
  get 'users/:id', to: 'users#show', as: :user

  # log in page with form:
  get '/login', to: 'sessions#new'

  # create (post) action for when log in form is submitted:
  post '/login', to: 'sessions#create'

  # delete action to log out:
  get '/logout', to: 'sessions#destroy'

  # pages:
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'

  # dark mode:
  get 'dark_mode', to: 'application#dark_mode'
  get 'light_mode', to: 'application#light_mode'

  # articles:
  resources :articles do
    resources :comments
  end
end
