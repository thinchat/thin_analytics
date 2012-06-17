ThinAnalytics::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'

  scope '/analytics' do
    match '/users/agents', :to => 'users#agents'
    match '/users/guests', :to => 'users#guests'
    match '/users/history', :to => 'users#history'
    match '/users/longhistory', :to => 'users#long_history'

    match '/rooms/active', :to => 'rooms#active'
    match '/rooms/pending', :to => 'rooms#pending'
    match '/rooms/history', :to => 'rooms#history'
    match '/rooms/longhistory', :to => 'rooms#long_history'

    resources :users
    resources :rooms
    mount Resque::Server.new, :at => "/resque"
  end
end
