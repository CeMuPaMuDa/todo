# frozen_string_literal: true
require 'resque/server'
Rails.application.routes.draw do
  mount RootApi => '/'
  mount Resque::Server.new, at: '/resque'
  scope '(:locale)' do
    namespace :admin do
      resources :roles
      resources :users
      root 'users#index'
    end

    devise_for :users
    resources :events do
      resources :items
    end
    get 'events/page/(:page(.:format))', to: 'events#index'

    get 'help', to: 'help#index', as: 'help'
    get 'about', to: 'about#index', as: 'about'

    root 'events#index'
  end
end
