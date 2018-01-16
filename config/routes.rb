Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  get 'welcome', to: 'static_pages#index'
  post 'cards/cardcheck',to:'cards#cardcheck'
  post '/',to:'cards#cardcheck'
  resources :cards
  resources :cabinet

  namespace :admin do
  resources :cards
  end
end
