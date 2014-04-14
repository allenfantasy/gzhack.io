Gzhack::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  scope '(:locale)', locale: /en|zh-CN/ do
    # You can have the root of your site routed with "root"
    root 'home#index'

    get '/event' => 'home#detail'
    get '/about' => 'home#about'
    get '/signup' => 'home#signup'
    get '/home' => 'home#index'

    post '/users' => 'users#create'
  end

  # Cpanel

  namespace :cpanel do
    resources :events
    resources :users

    get '/' => 'dashboard#index'
    post '/sign_in' => 'session#create', :as => 'session'
    delete '/sign_out' => 'session#destory', :as => 'destroy_session'
  end
end
