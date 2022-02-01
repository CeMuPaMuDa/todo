Rails.application.routes.draw do
scope "(:locale)" do
    namespace :admin do
      resources :roles
      resources :users
      root 'users#index'
    end

    devise_for :users
    resources :events
    get 'events/page/(:page(.:format))', to: 'events#index'

    get 'help', to: 'help#index', as: 'help'
    get 'about', to: 'about#index', as: 'about'

    root 'events#index' 
  end
end
