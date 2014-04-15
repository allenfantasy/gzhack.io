require 'resque/server'

Gzhack::Application.routes.draw do
  root 'home#index'

  get '/event' => 'home#detail'
  get '/about' => 'home#about'
  get '/signup' => 'home#signup'
  get '/home' => 'home#index'

  post '/users' => 'users#create'

  # Cpanel

  namespace :cpanel do
    resources :events
    resources :users do
      collection do
        post :export
      end
    end

    get '/' => 'dashboard#index'
    post '/sign_in' => 'session#create', :as => 'session'
    delete '/sign_out' => 'session#destory', :as => 'destroy_session'
  end

  mount Resque::Server.new, :at => "/resque"
end
