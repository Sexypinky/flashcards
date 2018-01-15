Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#index'
  get 'cards', to:'cards#index'
  get 'cards/delete', to:'cards#destroy'
  get 'cards/mycards', to:'cards#mycards'
  post 'cards/cardcheck',to:'cards#cardcheck'
  post '/',to:'cards#cardcheck'

  resources :cards
end
