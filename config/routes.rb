Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  get 'welcome', to: 'static_pages#index'
  get 'cards/mycards', to:'cards#mycards'
  post 'cards/cardcheck',to:'cards#cardcheck'
  post '/',to:'cards#cardcheck'
  resources :cards

  namespace :admin do
  resources :cards
  end
end
