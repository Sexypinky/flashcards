Rails.application.routes.draw do
  root 'static_pages#index'
  get 'cards/index', to:'cards#index'
  resources :cards
end
