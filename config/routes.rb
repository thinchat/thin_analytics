ThinAnalytics::Application.routes.draw do
  get "home/index"
  root :to => 'home#index'

  scope '/analytics' do
    resources :users
    resources :rooms
  end
end
