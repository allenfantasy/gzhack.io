require 'resque/server'

Gzhack::Application.routes.draw do
  scope '(:locale)', locale: /en|zh-CN/ do
    # You can have the root of your site routed with "root"
    root 'home#index'

    get '/event' => 'home#detail'
    get '/about' => 'home#about'
    get '/signup' => 'home#signup'
    get '/home' => 'home#index'
    #get '/sponsors' => 'home#sponsors'
    get '/partners' => 'home#partners'
    #get '/colleges' => 'home#colleges'

    post '/users' => 'users#create'
  end

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
