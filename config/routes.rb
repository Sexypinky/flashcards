Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static_pages#index'
  get 'welcome', to: 'static_pages#index'
  post 'cards/cardcheck',to:'cards#cardcheck'
  post '/',to:'cards#cardcheck'
  get 'cards/showdeck', to: 'cards#showdeck'
  get 'cards/actualdeck', to:'cards#actualdeck'
  resources :cards
  resources :cabinet

  namespace :admin do
  resources :cards
  end
end
