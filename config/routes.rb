Rails.application.routes.draw do
  get    'sessions/new'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  resources :users
  resources :heart_rate_logs
  resources :step_day_logs

  resources :access_codes
  resources :purposes

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/api/user/:id/purpose/:code',
    to: 'api#retrieve_user'

  get    '/api/users/purpose/:code',
    to: 'api#retrieve_all_users'

  root 'sessions#new'
end
