Rails.application.routes.draw do
  get    'sessions/new'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/api/user/:id/purpose/:purpose',
    to: 'api#retrieve_user'

  get    '/api/users/purpose/:purpose',
    to: 'api#retrieve_all_users'

  root 'sessions#new'
end
