Rails.application.routes.draw do
  root 'static_pages#index'
  get 'cards/index', to:'cards#index'
  post 'cards/cardcheck',to:'cards#cardcheck'
  post '/',to:'cards#cardcheck'
  resources :cards
end
