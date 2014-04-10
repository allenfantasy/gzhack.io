Gzhack::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '/event' => 'home#detail'
  get '/about' => 'home#about'
  get '/signup' => 'home#signup'

  post '/users' => 'users#create'

  # Cpanel

  namespace :cpanel do
    resources :events
    resources :users
    get '/dashboard' => 'dashboard#index'
  end
end
