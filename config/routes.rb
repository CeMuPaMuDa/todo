Rails.application.routes.draw do
  resources :events
  get 'help', to: 'help#index', as: 'help'
  get 'about', to: 'about#index', as: 'about'
  get 'events/page/(:page(.:format))', to: 'events#index'
  get 'events/index' 
  root 'events#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
