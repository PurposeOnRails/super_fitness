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

  scope "/api" do
    get    'users/:id/purpose/:code',
      to: 'api#retrieve_user'

    get    'users/:id/steps/purpose/:code',
      to: 'api#get_steps'

    get    'users/:id/steps/:mid/purpose/:code',
           to: 'api#get_step'

    get    'users/:id/heart_rate_logs/purpose/:code',
      to: 'api#get_heart_rate_logs'

    get    'users/:id/heart_rate_logs/:mid/purpose/:code',
           to: 'api#get_heart_rate_log'

    get    'users/:id/overview/user/purpose/:code',
           to: 'api#overview_user'

    get    'users/:id/overview/steps/purpose/:code',
           to: 'api#overview_steps'

    get    'users/:id/overview/heart/purpose/:code',
           to: 'api#overview_heart'

    get    'users/purpose/:code',
      to: 'api#retrieve_all_users'
  end

  root 'sessions#new'
end
