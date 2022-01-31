Rails.application.routes.draw do
scope "(:locale)", 
      locale: /#{I18n.available_locales.join("|")}/ do
    namespace :admin do
      resources :roles
      resources :users
      root 'users#index'
    end

    devise_for :users
    resources :events

    get 'help', to: 'help#index', as: 'help'
    get 'about', to: 'about#index', as: 'about'
    get 'events/page/(:page(.:format))', to: 'events#index'
    get 'events/index' 
    root 'events#index' 
  end
end
